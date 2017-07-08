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

class VenueSearchSerializer < ActiveModel::Serializer
  attributes :id, :name, :full_address

  # Output example:
  #   {
  #     "id":3,
  #     "name":"jimmy",
  #     "full_address":"123 any street, Altamonte Springs, FL 32701"
  #   }
  def full_address
    "#{object.address}, #{object.city}, #{object.state} #{object.zipcode}"
  end
end
