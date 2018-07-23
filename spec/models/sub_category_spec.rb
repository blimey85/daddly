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

RSpec.describe SubCategory, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:category) }
    it { is_expected.to have_many(:interests).dependent(:destroy) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:category_id) }
  end
end
