require 'rails_helper'

RSpec.describe Identity, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_uniqueness_of(:uid).scoped_to(:provider) }
  end

  describe Identity, '#name' do
    it 'returns the split first and last names' do
      user = build(:identity, name: 'Josh M. Steiner')
      expect(user.first_name).to eq 'Josh M.'
      expect(user.last_name).to eq 'Steiner'
    end
  end
end