# == Schema Information
#
# Table name: event_venues
#
#  id       :bigint(8)        not null, primary key
#  event_id :bigint(8)
#  venue_id :bigint(8)
#
# Indexes
#
#  index_event_venues_on_event_id  (event_id)
#  index_event_venues_on_venue_id  (venue_id)
#

class EventVenue < ApplicationRecord
  belongs_to :event
  belongs_to :venue

  validates :event_id, :venue_id, presence: true
end
