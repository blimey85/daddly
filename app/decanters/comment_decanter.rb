#  Decanter Information
#
#  commentable_id   :integer
#  commentable_type :string
#  body             :text
#  parent_id        :integer
#  user_id          :integer
#  edited_at        :datetime
#  votes_count     :integer
#

# class CommentDecanter < Decanter::Base
#   ignore :profile_picture_url, :fullname, :upvote_count, :created_at, :created_by_current_user, :user_has_upvoted
#
#   input :commentable_id, :integer
#   input :commentable_type, :string
#   input :body, :text
#   input :parent_id, :integer
#   input :user_id, :integer
#   input :edited_at, :datetime
#   input :votes_count, :integer
# end
