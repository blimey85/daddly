# == Schema Information
#
# Table name: administrators
#
#  id                        :bigint(8)        not null, primary key
#  email                     :string
#  password_digest           :string
#  first_name                :string
#  last_name                 :string
#  remember_token            :string
#  remember_token_expires_at :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

FactoryBot.define do
  factory :administrator do
    email "MyString"
    password_digest "MyString"
    first_name "MyString"
    last_name "MyString"
    remember_token "MyString"
    remember_token_expires_at "2018-07-23 01:21:02"
  end
end
