# == Schema Information
#
# Table name: sub_categories
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  category_id :integer
#

require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  it { is_expected.to belong_to(:category) }
  it { is_expected.to have_many(:interests) }
end
