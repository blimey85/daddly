# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  votable_id   :integer
#  votable_type :string(255)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_votes_on_votable_id_and_votable_type  (votable_id,votable_type)
#

require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:votable) }
    it { is_expected.to have_many(:votes) }
  end
end
