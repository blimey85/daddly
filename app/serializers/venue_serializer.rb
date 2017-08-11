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

class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zipcode
end
