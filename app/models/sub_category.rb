# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#

class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :interests
end
