# == Schema Information
#
# Table name: identities
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  provider     :string(255)
#  accesstoken  :string(255)
#  uid          :string(255)
#  name         :string(255)
#  email        :string(255)
#  nickname     :string(255)
#  image        :string(255)
#  phone        :string(255)
#  urls         :string(255)
#  refreshtoken :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_identities_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :identity do
  end
end
