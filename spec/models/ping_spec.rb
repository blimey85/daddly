# == Schema Information
#
# Table name: pings
#
#  id                   :bigint(8)        not null, primary key
#  pingable_id          :integer
#  pingable_type        :string
#  pinger_id            :bigint(8)
#  user_id              :bigint(8)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  pingable_parent_id   :integer
#  pingable_parent_type :string
#
# Indexes
#
#  index_pings_on_pingable_id_and_pingable_type_and_pinger_id  (pingable_id,pingable_type,pinger_id) UNIQUE
#  index_pings_on_user_id                                      (user_id)
#

RSpec.describe Ping, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:pingable) }
    it { is_expected.to have_many(:pings) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:pingable_id) }
    it { is_expected.to validate_presence_of(:pingable_type) }
    it { is_expected.to validate_presence_of(:pinger_id) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  context 'Model Serializer' do
    ping = FactoryBot.build_stubbed(:ping)
    subject { PingsSerializer.new(ping) }

    it 'includes the expected attributes' do
      expect(subject.attributes.keys).to contain_exactly(
        :id, :pinger_id, :user_id, :username, :qtip_title, :qtip_text
      )
    end
  end
end
