# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  name           :string
#  description    :text
#  starts_at      :datetime
#  ends_at        :datetime
#  rsvp_count     :integer
#  rsvp_min_limit :integer
#  rsvp_max_limit :integer
#  waitlist       :boolean
#  waitlist_count :integer
#  status         :integer
#  type           :integer
#  visibility     :integer
#  comments_count :integer          default(0), not null
#  votes_count    :integer          default(0), not null
#  user_id        :integer
#  venue_id       :integer # FIXME: remove this field
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_events_on_user_id   (user_id)
#  index_events_on_venue_id  (venue_id)
#

class Event < ApplicationRecord
  before_save :convert_to_datetime

  belongs_to :user

  has_many :comments, as: :commentable, inverse_of: :commentable, dependent: :destroy
  has_many  :event_categories, through: :event_event_categories
  has_many  :event_event_categories, dependent: :destroy
  has_many :event_venues, dependent: :destroy
  has_many  :reservations, dependent: :destroy
  has_many  :users, through: :reservations
  has_many :venues, through: :event_venues
  has_many :votes, as: :votable, inverse_of: :votable, dependent: :destroy

  # TODO: :start_date, :start_time, :end_date, :end_time, :event_categories ned to be conditionally required
  validates :description, :ends_at, :name, :starts_at, :user_id, presence: true

  accepts_nested_attributes_for :event_categories

  # used for date and time pickers which get merged to datetime field
  attr_accessor :start_date
  attr_accessor :start_time
  attr_accessor :end_date
  attr_accessor :end_time

  def convert_to_datetime
    self.starts_at = Time.zone.parse("#{start_date} #{start_time}") if start_date.present? && start_time.present?
    self.ends_at = Time.zone.parse("#{end_date} #{end_time}") if end_date.present? && end_time.present?
  end

  searchkick locations: ['locations']
  scope :search_import, -> { includes(:venues, :event_categories) }

  def search_data
    {
        name: name,
        description: description,
        venues_name: venues.map(&:name),
        venues_address: venues.map(&:address),
        venues_city: venues.map(&:city),
        venues_state: venues.map(&:state),
        venues_zipcode: venues.map(&:zipcode),
        locations: venues.map { |l| { lat: l.latitude, lon: l.longitude } }
    }
  end

  # used for virtual attributes
  include VirtusAttributes

  # used for updating comment counts
  # TODO: fix this!
  # counter_culture :category
end
