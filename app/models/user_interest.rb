# == Schema Information
#
# Table name: user_interests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  interest_id :integer
#  experience  :integer
#
# Indexes
#
#  index_user_interests_on_interest_id  (interest_id)
#  index_user_interests_on_user_id      (user_id)
#

class UserInterest < ApplicationRecord
  belongs_to  :user
  belongs_to  :interest

  validates :interest_id, :user_id, presence: true
end
