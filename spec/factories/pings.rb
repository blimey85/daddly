# == Schema Information
#
# Table name: pings
#
#  id                   :integer          not null, primary key
#  pingable_id          :integer
#  pingable_type        :string
#  pinger_id            :integer
#  user_id              :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  pingable_parent_id   :integer
#  pingable_parent_type :string
#
# Indexes
#
#  index_pings_on_pingable_id_and_pingable_type_and_pinger_id  (pingable_id,pingable_type,pinger_id) UNIQUE
#  index_pings_on_user_id                                      (user_id)
#

FactoryGirl.define do
  factory :ping do
    pingable_id 1
    pingable_type 1
    pinger_id 1
    user nil
  end
end
