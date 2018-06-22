# == Schema Information
#
# Table name: categories
#
#  id       :integer          not null, primary key
#  name     :string
#  cat_type :string
#

class Category < ApplicationRecord
  has_many :sub_categories, dependent: :destroy

  validates :name, presence: true
end
