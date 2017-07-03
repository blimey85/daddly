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
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
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
