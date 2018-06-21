module ApplicationHelper
  def check_user_interactions(items, user_id)
    items.each do |item|
      # note if item was created by current user
      item[:created_by_current_user] = true if item.user_id == user_id

      item.votes.each do |vote|
        # note if item was upvoted by current user
        (item[:user_has_upvoted] = true; break) if vote.user_id == user_id
      end
    end
    items.to_json
  end

  def timeago(time, options = {})
    return unless time
    options[:class] = 'timeago' if time > 12.hours.ago # only fuzzy last 12 hours
    time_utc = time.getutc.iso8601
    time_format = time.strftime("%B #{time.day.ordinalize}, %Y at %I:%M%P")
    content_tag(:time, time_format.to_s, options.merge(datetime: time_utc, title: time_format))
  end

  def segment_javascript_include
    javascript_include_tag 'segment' if Rails.env.production?
  end

  def user_services_providers
    @user_services_providers ||= current_user.services.map(&:provider)
  end
end
