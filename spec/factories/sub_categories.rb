# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#
# Indexes
#
#  index_sub_categories_on_category_id  (category_id)
#

FactoryBot.define do
  factory :sub_category do
    name 'My Sub Category'
    category_id 1
  end
end
