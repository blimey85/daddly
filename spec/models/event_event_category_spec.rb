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

RSpec.describe EventEventCategory, type: :model do
  it { is_expected.to belong_to(:event) }
  it { is_expected.to belong_to(:event_category) }
end

context 'Model Serializer' do
  let!(:event_event_category) { FactoryBot.build_stubbed(:event_event_category) }
  subject { EventEventCategoriesSerializer.new(event_event_category) }

  it 'includes the expected attributes' do
    expect(subject.attributes.keys).to contain_exactly(:event_id,
                                                       :event_category_id)
  end
end
