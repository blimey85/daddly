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
# == Output example:
#
#  {
#    "event_id": 1,
#    "event_category_id": 1
#  }
#

class EventEventCategoriesSerializer < ActiveModel::Serializer
  attributes :event_id
  attributes :event_category_id
end
