# == Schema Information
#
# Table name: event_event_categories
#
#  id                :bigint(8)        not null, primary key
#  event_id          :integer
#  event_category_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class EventEventCategory < ApplicationRecord
  belongs_to  :event
  belongs_to  :event_category
end
