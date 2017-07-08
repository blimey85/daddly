# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default("")
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  username               :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  age                    :integer
#  bio                    :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  zipcode                :integer
#  latitude               :float(24)
#  longitude              :float(24)
#  avater                 :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar                 :string(255)
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

  describe User, '#name' do
    it 'returns the concatenated first and last names' do
      user = build(:user, first_name: 'Josh', last_name: 'Steiner')
      expect(user.fullname).to eq 'Josh Steiner'
    end
  end
end
