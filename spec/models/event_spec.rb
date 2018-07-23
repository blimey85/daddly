# == Schema Information
#
# Table name: events
#
#  id             :bigint(8)        not null, primary key
#  name           :string
#  description    :text
#  starts_at      :datetime
#  ends_at        :datetime
#  rsvp_count     :integer
#  rsvp_min_limit :integer
#  rsvp_max_limit :integer
#  waitlist       :boolean
#  waitlist_count :integer
#  status         :integer
#  type           :integer
#  visibility     :integer
#  comments_count :integer          default(0), not null
#  votes_count    :integer          default(0), not null
#  user_id        :bigint(8)
#  venue_id       :bigint(8)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_events_on_user_id   (user_id)
#  index_events_on_venue_id  (venue_id)
#

RSpec.describe Event, type: :model do
  include_context 'user'

  context 'Model Associations' do
    it { is_expected.to have_many(:comments) } # does not need as: :commentable - this is automatic
    it { is_expected.to have_many(:event_categories).through(:event_event_categories) }
    it { is_expected.to have_many(:event_event_categories) }
    it { is_expected.to have_many(:event_venues) }
    it { is_expected.to have_many(:reservations) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:users).through(:reservations) }
    it { is_expected.to have_many(:venues).through(:event_venues) }
    it { is_expected.to have_many(:votes) } # does not need as: :votable - this is automatic
  end

  context 'Model Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_presence_of(:ends_at) }
    it { is_expected.to validate_presence_of(:user_id) }
  end

  context 'Model Serializer' do
    let!(:event) { FactoryBot.build_stubbed(:event, user: user) }
    subject { EventSerializer.new(event, scope: user, scope_name: :current_user) }

    it 'includes the expected attributes' do
      expect(subject.attributes.keys).to contain_exactly(:id,
                                                         :title,
                                                         :start,
                                                         :end,
                                                         :description,
                                                         :comments_count,
                                                         :votes_count,
                                                         :created_by_current_user,
                                                         :user_has_upvoted,
                                                         :categories)
    end
  end
end
