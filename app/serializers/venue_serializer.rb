class VenueSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :city, :state, :zipcode
end
