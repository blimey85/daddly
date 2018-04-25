# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default("")
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  username               :string
#  first_name             :string
#  last_name              :string
#  age                    :integer
#  bio                    :text
#  city                   :string
#  state                  :string
#  zipcode                :integer
#  latitude               :float
#  longitude              :float
#  avatar                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  moderator              :boolean
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Model Associations' do
    it { is_expected.to have_many(:identities) }
    it { is_expected.to have_many(:kids) }
    it { is_expected.to have_many(:user_interests) }
    it { is_expected.to have_many(:interests) }
  end

  context 'Model Validations' do
    # context 'email_required? true' do
    #   def email_required?
    #     true
    #   end
    #   it { is_expected.to validate_presence_of(:email) }
    # end
    # context 'email_required? false' do
    #   def email_required?
    #     false
    #   end
    #   it { is_expected.not_to validate_presence_of(:email) }
    # end
  end

  describe User, '#fullname' do
    it 'returns the concatenated first and last names' do
      user = FactoryBot.build(:user, first_name: 'Josh', last_name: 'Steiner')
      expect(user.fullname).to eq 'Josh Steiner'
    end
  end
end
