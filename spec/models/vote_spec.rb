# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  votable_id   :integer
#  votable_type :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_votes_on_user_id                      (user_id)
#  index_votes_on_votable_id_and_votable_type  (votable_id,votable_type)
#

RSpec.describe Vote, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:votable) }
    it { is_expected.to have_many(:votes).dependent(:destroy) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:votable_id) }
    it { is_expected.to validate_presence_of(:votable_type) }
    it { is_expected.to validate_presence_of(:user_id) }
  end
end
