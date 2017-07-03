class CommentDecanter < Decanter::Base
  input :commentable_id, :integer
  input :commentable_type, :string
  input :body, :text
  input :parent_id, :integer
  input :user_id, :integer
  input :edited_at, :datetime
  input :upvote_count, :integer
end
