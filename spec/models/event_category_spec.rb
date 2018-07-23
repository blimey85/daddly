# == Schema Information
#
# Table name: event_categories
#
#  id    :bigint(8)        not null, primary key
#  name  :string
#  color :string           default("000000")
#  icon  :string           default("fas fa-circle")
#

RSpec.describe EventCategory, type: :model do
  it { is_expected.to have_many(:event_event_categories) }
  it { is_expected.to have_many(:events) }
end

context 'Model Serializer' do
  let!(:event_category) { EventCategory.first }
  subject { EventCategoriesSerializer.new(event_category) }

  it 'includes the expected attributes' do
    expect(subject.attributes.keys).to contain_exactly(:name,
                                                       :id,
                                                       :color,
                                                       :icon)
  end
end
