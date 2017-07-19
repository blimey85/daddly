# == Schema Information
#
# Table name: interests
#
#  id              :integer          not null, primary key
#  sub_category_id :integer
#  name            :string(255)
#

class Interest < ApplicationRecord
  has_many  :user_interests
  has_many  :users, through: :user_interests

  belongs_to :sub_category

  validates :sub_category_id, :name, presence: true
end
