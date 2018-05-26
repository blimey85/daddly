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

# == Output example:
#
# {
#   "id": 14,
#   "name": "Gary's House",
#   "address": "123 Any Street",
#   "city": "Altamonte Springs",
#   "state": "FL",
#   "zipcode": 32701,
#   "full_address": "123 Any Street, Altamonte Springs, FL 32701"
# }

class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zipcode, :full_address

  def full_address
    "#{object.address}, #{object.city}, #{object.state} #{object.zipcode}"
  end
end
