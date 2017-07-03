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
end
