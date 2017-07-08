# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commentable_type :string(255)
#  body             :text(65535)
#  parent_id        :integer
#  user_id          :integer
#  edited_at        :datetime
#  votes_count      :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_comments_on_commentable_id_and_commentable_type  (commentable_id,commentable_type)
#

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true, counter_cache: :comments_count
  has_many :comments, as: :commentable

  belongs_to :user

  has_many :votes, as: :votable

  # used for virtual attributes
  include VirtusAttributes
end
