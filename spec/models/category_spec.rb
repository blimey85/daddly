# == Schema Information
#
# Table name: categories
#
#  id   :integer          not null, primary key
#  name :string(255)
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'Model Associations' do
    it { is_expected.to have_many(:sub_categories) }
  end
end
