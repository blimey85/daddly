# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string(255)
#

FactoryGirl.define do
  factory :category do
    name 'MyString'
  end
end
