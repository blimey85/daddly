# == Schema Information
#
# Table name: kids
#
#  id      :integer          not null, primary key
#  gender  :integer          default(0), not null
#  age     :integer          not null
#  user_id :integer
#
# Indexes
#
#  index_kids_on_user_id  (user_id)
#

class Kid < ApplicationRecord
  belongs_to :user
  enumerate :gender, with: Gender

  validates :gender, :age, :user_id, presence: true
end
