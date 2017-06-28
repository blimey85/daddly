# == Schema Information
#
# Table name: event_venues
#
#  id         :integer          not null, primary key
#  events_id  :integer
#  venue_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventVenue < ApplicationRecord
  belongs_to :event
  belongs_to :venue
end
