# == Schema Information
#
# Table name: pings
#
#  id                   :bigint(8)        not null, primary key
#  pingable_id          :integer
#  pingable_type        :string
#  pinger_id            :bigint(8)
#  user_id              :bigint(8)
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

FactoryBot.define do
  factory :ping do
    pingable_id 1
    pingable_type 'Comment'
    pinger_id 1
    user_id 1
    pingable_parent_id 1
    pingable_parent_type 'Event'
  end
end
