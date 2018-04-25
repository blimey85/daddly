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

  # def categories
  #   # object.event_categories
  #   [ 'ARTS', 'CHARITY' ]
  # end

  def categories
    object.event_categories.map do |category|
      EventCategoriesSerializer.new(category)
    end
  end

end
