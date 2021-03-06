# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  username               :string
#  first_name             :string
#  last_name              :string
#  age                    :integer
#  bio                    :text
#  city                   :string
#  state                  :string
#  zipcode                :integer
#  latitude               :float
#  longitude              :float
#  avatar                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  moderator              :boolean
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryBot.define do
  factory :user do
    username    { Faker::Internet.user_name(8) }
    age         { Faker::Number.between(13, 103) }
    email       { Faker::Internet.email(username) }
    bio         { Faker::Hipster.paragraph(3) }
    zipcode     { Faker::Address.zip_code }
    first_name  { Faker::Name.first_name }
    last_name   { Faker::Name.last_name }
    password 'password1234'
    password_confirmation 'password1234'
  end
end
