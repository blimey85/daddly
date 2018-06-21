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

FactoryBot.define do
  factory :interest do
    name 'Card Games'
    sub_category_id 1
  end
end
