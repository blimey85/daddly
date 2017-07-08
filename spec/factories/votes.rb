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

FactoryGirl.define do
  factory :vote do
    
  end
end
