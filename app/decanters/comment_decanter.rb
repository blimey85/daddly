#  Decanter Information
#
#  commentable_id   :integer
#  commentable_type :string
#  body             :text
#  parent_id        :integer
#  user_id          :integer
#  edited_at        :datetime
#  upvote_count     :integer
#

class CommentDecanter < Decanter::Base
  input :commentable_id, :integer
  input :commentable_type, :string
  input :body, :text
  input :parent_id, :integer
  input :user_id, :integer
  input :edited_at, :datetime
  input :upvote_count, :integer
end
