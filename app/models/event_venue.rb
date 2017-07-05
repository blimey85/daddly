# == Schema Information
#
# Table name: event_venues
#
#  id       :integer          not null, primary key
#  event_id :integer
#  venue_id :integer
#
# Indexes
#
#  index_event_venues_on_event_id  (event_id)
#  index_event_venues_on_venue_id  (venue_id)
#

class EventVenue < ApplicationRecord
  belongs_to :event
  belongs_to :venue
end
