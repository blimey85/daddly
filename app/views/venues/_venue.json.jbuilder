json.extract! venue, :id, :name, :address, :city, :state, :zipcode, :latitude, :longitude, :visibility, :events_id, :created_at, :updated_at
json.url venue_url(venue, format: :json)
