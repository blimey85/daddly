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

FactoryBot.define do
  startsat = Faker::Time.forward(23, :morning)

  factory :event do
    transient do
      venue { build_stubbed(:venue) }
    end

    name           { Faker::HowIMetYourMother.high_five + ' Party' }
    description    { Faker::HowIMetYourMother.quote }
    starts_at      { startsat }
    ends_at        { startsat + 4.hours }
    rsvp_min_limit { Faker::Number.between(0, 10) }
    rsvp_max_limit { Faker::Number.between(10, 100) }
    association :user

    trait :in_the_future do
      starts_at { 2.days.from_now }
      ends_at { starts_at + 4.hours }
    end

    trait :in_the_past do
      starts_at { 2.days.ago }
      ends_at { starts_at + 4.hours }
    end

    after(:create) do |event, evaluator|
      event.venues << evaluator.venue
    end
  end
end
