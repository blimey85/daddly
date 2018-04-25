# == Schema Information
#
# Table name: event_event_categories
#
#  id                :integer          not null, primary key
#  event_id          :integer
#  event_category_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe EventEventCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
