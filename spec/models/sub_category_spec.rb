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

require 'rails_helper'

RSpec.describe SubCategory, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:interests) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:category_id) }
  end
end
