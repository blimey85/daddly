# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#

FactoryGirl.define do
  factory :sub_category do
    name "MyString"
    category nil
  end
end
