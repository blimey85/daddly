# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commentable_type :string
#  body             :text
#  parent_id        :integer
#  user_id          :integer
#  edited_at        :datetime
#  upvote_count     :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  belongs_to :user

  has_many :votes, as: :votable

  # used for virtual attributes
  include VirtusAttributes
end
