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
end
