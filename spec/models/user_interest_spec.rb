# == Schema Information
#
# Table name: user_interests
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  interest_id :integer
#  experience  :integer
#
# Indexes
#
#  index_user_interests_on_interest_id  (interest_id)
#  index_user_interests_on_user_id      (user_id)
#

require 'rails_helper'

RSpec.describe UserInterest, type: :model do
  context 'Model Associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:interest) }
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:interest_id) }
  end
end
