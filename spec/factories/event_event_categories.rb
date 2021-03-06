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

FactoryBot.define do
  factory :event_event_category do
    event_id 1
    event_category_id 1
  end
end
