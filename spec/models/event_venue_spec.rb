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

require 'rails_helper'

RSpec.describe EventVenue, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:event) }
    it { is_expected.to belong_to(:venue) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:event_id) }
    it { is_expected.to validate_presence_of(:venue_id) }
  end
end
