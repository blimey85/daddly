# == Schema Information
#
# Table name: events
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :text(65535)
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
#  user_id        :integer
#  venue_id       :integer
#  updated_at     :datetime         not null
#  created_at     :datetime         not null
#  comments_count :integer          default(0), not null
#  votes_count    :integer          default(0), not null
#
# Indexes
#
#  index_events_on_user_id   (user_id)
#  index_events_on_venue_id  (venue_id)
#

require 'rails_helper'

RSpec.describe Event, type: :model do
  it { is_expected.to have_many(:event_venues) }
  it { is_expected.to have_many(:venues) }
  it { is_expected.to have_many(:comments) }
end

# has_many  :event_venues
# has_many  :venues, through: :event_venues
# has_many :comments, as: :commentable
