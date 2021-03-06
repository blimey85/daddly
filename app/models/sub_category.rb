# == Schema Information
#
# Table name: sub_categories
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  category_id :bigint(8)
#
# Indexes
#
#  index_sub_categories_on_category_id  (category_id)
#

class SubCategory < ApplicationRecord
  belongs_to :category

  has_many :interests, dependent: :destroy

  validates :name, :category_id, presence: true
end
