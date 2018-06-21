# == Schema Information
#
# Table name: categories
#
#  id       :integer          not null, primary key
#  name     :string
#  cat_type :string
#

RSpec.describe Category, type: :model do
  context 'Model Associations' do
    it { is_expected.to have_many(:sub_categories) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
