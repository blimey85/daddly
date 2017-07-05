# == Schema Information
#
# Table name: votes
#
#  id           :integer          not null, primary key
#  votable_id   :integer
#  votable_type :integer
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_votes_on_votable_id_and_votable_type  (votable_id,votable_type)
#

class Vote < ApplicationRecord
  belongs_to :comments
end
