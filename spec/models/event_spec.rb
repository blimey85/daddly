# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
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
#  user_id        :integer
#  venue_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_events_on_user_id   (user_id)
#  index_events_on_venue_id  (venue_id)
#

RSpec.describe Event, type: :model do
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
end
