# == Schema Information
#
# Table name: user_interests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  interest_id :integer
#  experience  :integer
#

class UserInterest < ApplicationRecord
  belongs_to  :user
  belongs_to  :interest
end
