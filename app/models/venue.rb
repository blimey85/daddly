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

class Venue < ApplicationRecord
  extend StatesHelper

  has_many  :event_venues, dependent: :destroy
  has_many  :events, through: :event_venues
  has_many :future_events, -> { where('starts_at >= ?', Time.zone.today).order(starts_at: :asc) }, through: :event_venues, source: :event
  has_many :past_events,   -> { where('starts_at <  ?', Time.zone.today).order(starts_at: :desc) }, through: :event_venues, source: :event

  validates :name, :address, :city, :state, :zipcode, :latitude, :longitude, presence: true

  def full_address
    "#{address}, #{city}, #{state} #{zipcode}"
  end

  ### Used for displaying address on two lines
  # this is the street portion
  def street_address_one
    address
  end

  # this is the non-street portion
  def street_address_two
    "#{city}, #{state} #{zipcode}"
  end

  def street_address_city_state
    "#{city}, #{state}"
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
  before_validation :geocode, if: :need_to_geocode?

  private

  # Only geocode if we don't have lat and lon OR any part of the address has changed
  def need_to_geocode?
    latitude.blank? || longitude.blank? || address_changed? || city_changed? || state_changed? || zipcode_changed?
  end
end
