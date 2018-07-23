# == Schema Information
#
# Table name: event_categories
#
#  id    :bigint(8)        not null, primary key
#  name  :string
#  color :string           default("000000")
#  icon  :string           default("fas fa-circle")
#
# == Output example:
#
#  {
#    "name": "Arts",
#    "id": 1,
#    "color": "000000",
#    "icon": "far fa-paint-brush"
#  }
#

class EventCategoriesSerializer < ActiveModel::Serializer
  attributes :name
  attributes :id
  attributes :color
  attributes :icon
end
