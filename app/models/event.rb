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
#  venue_id       :integer
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
  belongs_to :venue
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  belongs_to :user

  has_many  :reservations
  has_many  :users, through: :reservations

  has_many  :event_event_categories
  has_many  :event_categories, through: :event_event_categories
  accepts_nested_attributes_for :event_categories

  # validates :name, :description, :starts_at, :ends_at, :user_id, :venue_id, presence: true

  # used for date and time pickers which get merged to datetime field
  attr_accessor :start_date
  attr_accessor :start_time
  attr_accessor :end_date
  attr_accessor :end_time

  def convert_to_datetime
    self.starts_at = DateTime.parse("#{start_date} #{start_time}") if start_date.present? && start_time.present?
    self.ends_at = DateTime.parse("#{end_date} #{end_time}") if end_date.present? && end_time.present?
  end

  # used for virtual attributes
  include VirtusAttributes

  # used for updating comment counts
  # TODO: fix this!
  # counter_culture :category
end
