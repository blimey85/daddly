# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#
# Indexes
#
#  index_sub_categories_on_category_id  (category_id)
#

class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :interests

  validates :name, :category_id, presence: true
end
