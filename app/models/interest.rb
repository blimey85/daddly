# == Schema Information
#
# Table name: interests
#
#  id          :integer          not null, primary key
#  category    :string
#  subcategory :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Interest < ApplicationRecord
  has_many  :user_interests
  has_many  :users, :through => :user_interests
end
