# == Schema Information
#
# Table name: kids
#
#  id      :bigint(8)        not null, primary key
#  gender  :integer          default(0), not null
#  age     :integer          not null
#  user_id :bigint(8)
#
# Indexes
#
#  index_kids_on_user_id  (user_id)
#

class Kid < ApplicationRecord
  enumerate :gender, with: Gender

  belongs_to :user, optional: true

  validates :gender, :age, :user_id, presence: true
end
