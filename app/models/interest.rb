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
  belongs_to :sub_category

  has_many  :user_interests, dependent: :destroy
  has_many  :users, through: :user_interests

  validates :sub_category_id, :name, presence: true
end
