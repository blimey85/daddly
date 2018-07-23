# == Schema Information
#
# Table name: votes
#
#  id           :bigint(8)        not null, primary key
#  votable_id   :integer
#  votable_type :string
#  user_id      :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_votes_on_user_id                      (user_id)
#  index_votes_on_votable_id_and_votable_type  (votable_id,votable_type)
#

class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true, counter_cache: :votes_count

  has_many :votes, as: :votable, dependent: :destroy

  validates :votable_id, :votable_type, :user_id, presence: true
end
