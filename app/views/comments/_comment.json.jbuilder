json.extract! comment, :id, :commentable_id, :commentable_type, :body, :parent_id, :user_id, :edited_at, :upvote_count, :created_at, :updated_at
json.url comment_url(comment, format: :json)
