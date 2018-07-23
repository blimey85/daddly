# == Schema Information
#
# Table name: venues
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  address    :string
#  city       :string
#  state      :string
#  zipcode    :integer
#  latitude   :float
#  longitude  :float
#  visibility :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

RSpec.describe Venue do
  include_context 'user'
  include_context 'venue'

  context 'Model Associations' do
    it { is_expected.to have_many(:event_venues) }
    it { is_expected.to have_many(:events) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:state) }
    it { is_expected.to validate_presence_of(:zipcode) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
  end

  context 'Model Serializer' do
    subject { VenueSerializer.new(venue) }

    it 'includes the expected attributes' do
      expect(subject.attributes.keys).to contain_exactly(
        :id, :name, :address, :city, :state, :zipcode, :full_address
      )
    end
  end

  context 'Model Search Serializer' do
    subject { VenueSearchSerializer.new(venue) }

    it 'includes the expected attributes' do
      expect(subject.attributes.keys).to contain_exactly(:id,
                                                         :name,
                                                         :full_address)
    end
  end

  context 'Address Manipulations' do
    it 'returns the concatenated full address' do
      expect(venue.full_address).to eq '1905 Cedar Street, Calistoga, CA 94515'
    end

    it 'returns the street address portion' do
      expect(venue.street_address_one).to eq '1905 Cedar Street'
    end

    it 'returns the city, state, and zip portions' do
      expect(venue.street_address_two).to eq 'Calistoga, CA 94515'
    end

    it 'returns the city and state portions' do
      expect(venue.street_address_city_state).to eq 'Calistoga, CA'
    end
  end

  context 'Event Creation' do
    it 'Creates Past and Future Events Correctly', :aggregate_failures do
      FactoryBot.create_list(:event, 5, :in_the_future, venue: venue, user: user)
      FactoryBot.create_list(:event, 5, :in_the_past, venue: venue, user: user)

      expect(venue.events.length).to eq 10
      expect(venue.future_events.length).to eq 5
      expect(venue.past_events.length).to eq 5
    end
  end
end
