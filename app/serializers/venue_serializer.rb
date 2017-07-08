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

class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zipcode
end
