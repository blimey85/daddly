# == Schema Information
#
# Table name: identities
#
#  id           :bigint(8)        not null, primary key
#  user_id      :bigint(8)
#  provider     :string
#  accesstoken  :string
#  uid          :string
#  name         :string
#  email        :string
#  nickname     :string
#  image        :string
#  phone        :string
#  urls         :string
#  refreshtoken :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_identities_on_user_id  (user_id)
#

FactoryBot.define do
  factory :identity do
    association :user
    provider 'facebook'
    accesstoken 'EAAEDlzPZAwpABANjP1dJSy85a1hSCWy3h6ulYyYZCpzUASx65WYrAJogaQUUXFhVTmZBvEfYwgAE7CkcYDClPqsBJZC34c57kk0NwJEt1Qg7HoKHxaKDXDKc0wKJnxkCD27879Hxjbfn2wEzcyDYAhxsNyNr6sAZD'
    uid '1234567890'
    name 'Bob Newhart'
    email { Faker::Internet.email }
    image 'http://graph.facebook.com/v2.6/1234567890/picture'
  end
end
