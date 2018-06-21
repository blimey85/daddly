# == Schema Information
#
# Table name: interests
#
#  id              :integer          not null, primary key
#  name            :string
#  sub_category_id :integer
#
# Indexes
#
#  index_interests_on_sub_category_id  (sub_category_id)
#

RSpec.describe Interest, type: :model do
  context 'Model Associations' do
    it { is_expected.to have_many(:user_interests) }
    it { is_expected.to have_many(:users) }
    it { is_expected.to belong_to(:sub_category) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:sub_category_id) }
    it { is_expected.to validate_presence_of(:name) }
  end
end
