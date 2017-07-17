class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def check_user_interactions(item, user_id)
    # note if item was created by current user
    item[:created_by_current_user] = true if item.user_id == user_id

    item.votes.each do |vote|
      # note if item was upvoted by current user
      (item[:user_has_upvoted] = true; break) if vote.user_id == user_id
    end
  end

  def check_mutli_user_interactions(items, user_id)
    items.each do |item|
      check_user_interactions(item, user_id)
    end
  end
end
