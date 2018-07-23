# == Schema Information
#
# Table name: reservations
#
#  id               :bigint(8)        not null, primary key
#  event_id         :bigint(8)
#  user_id          :bigint(8)
#  reservation_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_reservations_on_event_id  (event_id)
#  index_reservations_on_user_id   (user_id)
#

class Reservation < ApplicationRecord
  belongs_to  :user
  belongs_to  :event
end

# reservation_type { }not_interested - going - not_going }
