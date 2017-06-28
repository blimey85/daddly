json.extract! event, :id, :name, :description, :starts_at, :ends_at, :rsvp_count, :rsvp_min_limit, :rsvp_max_limit, :waitlist, :waitlist_count, :status, :type, :visibility, :venue_id, :created_at, :updated_at
json.url event_url(event, format: :json)
