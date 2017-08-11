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

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true, counter_cache: :comments_count
  has_many :comments, as: :commentable

  has_many :pings, as: :pingable

  belongs_to :user

  has_many :votes, as: :votable

  # used for virtual attributes
  include VirtusAttributes

  validates :commentable_id, :commentable_type, :body, :user_id, presence: true
end
