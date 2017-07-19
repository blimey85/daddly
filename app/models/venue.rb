# == Schema Information
#
# Table name: venues
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  city       :string(255)
#  state      :string(255)
#  zipcode    :integer
#  latitude   :float(24)
#  longitude  :float(24)
#  visibility :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Venue < ApplicationRecord
  extend StatesHelper
  has_many  :event_venues
  has_many  :events, through: :event_venues

  validates :name, :address, :city, :state, :zipcode, :latitude, :longitude, presence: true

  # Geo Location Block
  geocoded_by :zipcode do |obj, results|
    if (geo = results.first)
      obj.city = geo.city
      obj.state = STATES.key(geo.state) # convert state to abbreviation
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  after_validation :geocode
end
