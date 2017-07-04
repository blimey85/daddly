class VenueSearchSerializer < ActiveModel::Serializer
  attributes :id, :name, :full_address

  def full_address
    "#{object.address}, #{object.city}, #{object.state} #{object.zipcode}"
  end
end
