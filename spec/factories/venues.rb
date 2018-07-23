# == Schema Information
#
# Table name: venues
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  address    :string
#  city       :string
#  state      :string
#  zipcode    :integer
#  latitude   :float
#  longitude  :float
#  visibility :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :venue do
    name  { Faker::Company.name }
    address { Faker::Address.street_address }
    city { Faker::Address.community }
    state { Faker::Address.state_abbr }
    zipcode { Faker::Address.zip_code }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
