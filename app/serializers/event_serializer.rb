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
# == Output example:
#
#  {
#    "id": 1,
#    "title": "Beach Day",
#    "start": "2017-07-14 10:05:00 -0400",
#    "end": "2017-07-14 10:05:00 -0400",
#    "description": "Going to the beach! How about Daytona Beach?",
#    "comments_count": 67,
#    "votes_count": 0,
#    "created_by_current_user": 1,
#    "user_has_upvoted": false,
#    "categories": [
#      {
#         "name": "Arts",
#         "id": 1,
#         "color": "000000",
#         "icon": "far fa-paint-brush"
#      }
#    ]
#  }
#

class EventSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :start,
             :end,
             :description,
             :comments_count,
             :votes_count,
             :created_by_current_user,
             :user_has_upvoted,
             :categories

  def title
    object.name
  end

  def start
    object.starts_at
  end

  def end
    object.ends_at
  end

  def created_by_current_user
    object.user_id == current_user.id ? 1 : 0
  end

  def user_has_upvoted
    upvoted = object.votes.select { |x| x.user_id == current_user.id }
    upvoted.present?
  end

  def categories
    object.event_categories.map do |category|
      EventCategoriesSerializer.new(category).attributes
    end
  end
end
