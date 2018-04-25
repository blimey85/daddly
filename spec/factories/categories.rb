# == Schema Information
#
# Table name: categories
#
#  id       :integer          not null, primary key
#  name     :string
#  cat_type :string
#

FactoryBot.define do
  factory :category do
    name 'MyString'
  end
end
