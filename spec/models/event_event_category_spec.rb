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

RSpec.describe EventEventCategory, type: :model do
  it { is_expected.to belong_to(:event) }
  it { is_expected.to belong_to(:event_category) }
end
