# == Schema Information
#
# Table name: event_venues
#
#  id       :integer          not null, primary key
#  event_id :integer
#  venue_id :integer
#

class EventVenue < ApplicationRecord
  belongs_to :event
  belongs_to :venue
end
