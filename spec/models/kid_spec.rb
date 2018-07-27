# == Schema Information
#
# Table name: kids
#
#  id      :bigint(8)        not null, primary key
#  gender  :integer          default("Not Saying"), not null
#  age     :integer          not null
#  user_id :bigint(8)
#
# Indexes
#
#  index_kids_on_user_id  (user_id)
#

RSpec.describe Kid, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:age) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
