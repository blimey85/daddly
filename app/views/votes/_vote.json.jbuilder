json.extract! vote, :id, :votable_id, :votable_type, :user, :created_at, :updated_at
json.url vote_url(vote, format: :json)
