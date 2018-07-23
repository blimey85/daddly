# == Schema Information
#
# Table name: user_interests
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  interest_id :bigint(8)
#  experience  :integer
#
# Indexes
#
#  index_user_interests_on_interest_id  (interest_id)
#  index_user_interests_on_user_id      (user_id)
#

FactoryBot.define do
  factory :user_interest do
    user_id 1
    interest_id 1
    experience 5
  end
end
