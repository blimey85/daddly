# == Schema Information
#
# Table name: reservations
#
#  id               :integer          not null, primary key
#  event_id         :integer
#  user_id          :integer
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