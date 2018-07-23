# == Schema Information
#
# Table name: identities
#
#  id           :bigint(8)        not null, primary key
#  user_id      :bigint(8)
#  provider     :string
#  accesstoken  :string
#  uid          :string
#  name         :string
#  email        :string
#  nickname     :string
#  image        :string
#  phone        :string
#  urls         :string
#  refreshtoken :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_identities_on_user_id  (user_id)
#

RSpec.describe Identity, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:uid) }
    it { is_expected.to validate_presence_of(:provider) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_uniqueness_of(:uid).scoped_to(:provider) }
  end

  describe Identity, '#first_name, #last_name' do
    it 'returns the split first and last names' do
      user = build(:identity, name: 'Josh M. Steiner')
      expect(user.first_name).to eq 'Josh M.'
      expect(user.last_name).to eq 'Steiner'
    end
  end

  # Setup test data in the form of an OpenStruct
  auth_data = {
    provider: 'facebook',
    uid: '1234567890'
  }
  info = {
    id: 11,
    accesstoken: 'ya66.GlugBKtAxJVCZxRuXnNIMLOLUChQfHjQaNji1l7VL3gyjqzV2kIEV1bCGo3wRDJbt8Cj6Ou1CH0LviULVyxwfDOD7X3nGs4tlZCumWAFBM3TP-RX2ef6aEt9Z0uT',
    uid: '110614351506923213293',
    name: 'Bob Newhart',
    email: 'facebook@gmail.com',
    image: 'https://lh6.googleusercontent.com/-lUlB-235F30/AAAAAAAAAAI/AAAAAAAABjd/EqyGW40oVb7/photo.jpg',
    refreshtoken: '1/YCd5Uj69ODtdU56lVhlOpPvhD3aJcwR0O_IcRWwfw78'
  }
  credentials = {
    expires_at: ''
  }
  auth = OpenStruct.new(auth_data)
  auth.info = OpenStruct.new(info)
  auth.credentials = OpenStruct.new(credentials)

  scenario '#find_for_auth', :aggregate_failures do
    identity = Identity.find_for_oauth(auth)
    expect(identity.name).to eq 'Bob Newhart'
  end
end
