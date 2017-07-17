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

class EventSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :start,
             :end,
             :description,
             :comments_count,
             :votes_count,
             :created_by_current_user,
             :user_has_upvoted

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
end
