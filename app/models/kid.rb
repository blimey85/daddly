# == Schema Information
#
# Table name: kids
#
#  id      :integer          not null, primary key
#  gender  :integer          default(0), not null
#  age     :integer          not null
#  user_id :integer
#

class Kid < ApplicationRecord
  belongs_to :user
  enumerate :gender, with: Gender
end
