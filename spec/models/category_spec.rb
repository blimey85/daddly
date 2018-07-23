# == Schema Information
#
# Table name: categories
#
#  id       :bigint(8)        not null, primary key
#  name     :string
#  cat_type :string
#

RSpec.describe Category, type: :model do
  context 'Model Associations' do
    it { is_expected.to have_many(:sub_categories).dependent(:destroy) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:name) }
  end
end
