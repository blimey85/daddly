# == Schema Information
#
# Table name: comments
#
#  id               :bigint(8)        not null, primary key
#  commentable_id   :integer
#  commentable_type :string
#  body             :text
#  parent_id        :integer
#  edited_at        :datetime
#  votes_count      :integer          default(0)
#  user_id          :bigint(8)
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
  belongs_to :user

  has_many :comments, as: :commentable, inverse_of: :commentable, dependent: :destroy
  has_many :pings, as: :pingable, inverse_of: :pingable, dependent: :destroy
  has_many :votes, as: :votable, inverse_of: :votable, dependent: :destroy

  # used for virtual attributes
  include VirtusAttributes

  validates :commentable_id, :commentable_type, :body, :user_id, presence: true
end
