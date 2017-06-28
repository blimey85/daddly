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
  has_many  :event_venues
  has_many  :events, :through => :event_venues

  # Geo Location Block
  validates :zipcode, presence: true
  geocoded_by :zipcode  do |obj,results|
    if geo = results.first
      obj.city = geo.city
      obj.state = ::States.key(geo.state) # convert state to abbreviation
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
    end
  end
  after_validation :geocode
end
