# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commentable_type :string
#  body             :text
#  parent_id        :integer
#  edited_at        :datetime
#  votes_count      :integer          default(0)
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_commentable_id_and_commentable_type  (commentable_id,commentable_type)
#  index_comments_on_user_id                              (user_id)
#

class CommentSerializer < ActiveModel::Serializer
  attributes  :id,
              :content,
              :parent_id,
              :user_id,
              :edited_at,
              :created_at,
              :fullname,
              :profile_picture_url,
              :commentable_id,
              :commentable_type,
              :created_by_current_user,
              :upvote_count,
              :user_has_upvoted,
              :pings

  def content
    object.body
  end

  def created_by_current_user
    object.user_id == current_user.id ? 1 : 0
  end

  def fullname
    object.user.fullname
  end

  def pings
    object.pings.map do |ping|
      PingsSerializer.new(ping)
    end
  end

  def profile_picture_url
    object.user.avatar.url
  end

  def upvote_count
    object.votes_count ||= 0
  end

  def user_has_upvoted
    upvoted = 0
    object.votes.map do |vote|
      (upvoted = 1; break) if vote.user_id == current_user.id
    end
    upvoted
  end
end
