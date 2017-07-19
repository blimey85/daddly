# == Schema Information
#
# Table name: pings
#
#  id            :integer          not null, primary key
#  pingable_id   :integer
#  pingable_type :string(255)
#  pinger_id     :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_pings_on_user_id  (user_id)
#

require 'rails_helper'

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
end
