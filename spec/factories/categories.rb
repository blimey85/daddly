# == Schema Information
#
# Table name: categories
#
#  id       :bigint(8)        not null, primary key
#  name     :string
#  cat_type :string
#

FactoryBot.define do
  factory :category do
    name 'MyString'
  end
end
