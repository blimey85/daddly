# == Schema Information
#
# Table name: event_categories
#
#  id    :bigint(8)        not null, primary key
#  name  :string
#  color :string           default("000000")
#  icon  :string           default("fas fa-circle")
#

class EventCategory < ApplicationRecord
  has_many  :event_event_categories, dependent: :destroy
  has_many  :events, through: :event_event_categories
end
