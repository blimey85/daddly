# == Schema Information
#
# Table name: interests
#
#  id              :integer          not null, primary key
#  name            :string
#  sub_category_id :integer
#
# Indexes
#
#  index_interests_on_sub_category_id  (sub_category_id)
#

class Interest < ApplicationRecord
  has_many  :user_interests
  has_many  :users, through: :user_interests

  belongs_to :sub_category

  validates :sub_category_id, :name, presence: true
end
