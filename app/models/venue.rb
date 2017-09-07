# == Schema Information
#
# Table name: venues
#
#  id         :integer          not null, primary key
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

class Venue < ApplicationRecord
  extend StatesHelper
  has_many  :event_venues
  has_many  :events, through: :event_venues

  validates :name, :address, :city, :state, :zipcode, :latitude, :longitude, presence: true

  def full_address
    "#{address}, #{city}, #{state} #{zipcode}"
  end

  # Geo Location Block
  geocoded_by :full_address do |obj, results|
    if (geo = results.first)
      obj.city = geo.city
      obj.state = STATES.key(geo.state) # convert state to abbreviation
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  after_validation :geocode
end
