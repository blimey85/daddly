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
  has_one :event_venue
  has_one :venue, through: :event_venue
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  belongs_to :user

  # validates :name, :description, :starts_at, :ends_at, :user_id, :venue_id, presence: true

  # used for date and time pickers which get merged to datetime field
  attr_accessor :start_date
  attr_accessor :start_time
  attr_accessor :end_date
  attr_accessor :end_time

  # used for virtual attributes
  include VirtusAttributes

  # used for updating comment counts
  # TODO: fix this!
  # counter_culture :category
end
