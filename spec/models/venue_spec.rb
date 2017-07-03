require 'rails_helper'

RSpec.describe Venue, type: :model do
  context 'Model Associations' do
    it { is_expected.to have_many(:event_venues) }
    it { is_expected.to have_many(:events) }
  end
end
