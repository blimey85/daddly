# == Schema Information
#
# Table name: kids
#
#  id      :integer          not null, primary key
#  gender  :integer          default(0), not null
#  age     :integer          not null
#  user_id :integer
#
# Indexes
#
#  index_kids_on_user_id  (user_id)
#

FactoryBot.define do
  factory :kid do
    gender [1, 2].sample
    age { Faker::Number.between(0, 21) }
    user_id 1
  end
end
