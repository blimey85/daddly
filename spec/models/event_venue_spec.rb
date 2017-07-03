# == Schema Information
#
# Table name: event_venues
#
#  id       :integer          not null, primary key
#  event_id :integer
#  venue_id :integer
#

require 'rails_helper'

RSpec.describe EventVenue, type: :model do
  it { is_expected.to belong_to(:event) }
  it { is_expected.to belong_to(:venue) }
end
