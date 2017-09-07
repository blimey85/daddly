class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.first_name.blank?
      edit_user_url(resource.id)
    else
      super
    end
  end

  helper_method :mailbox

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

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations
  end

  def mentions_add(mentioned_ids, mentionable_type, mentionable_id, mentioner_id, mentionable_parent_type, mentionable_parent_id)
    pings = []
    mentioned_ids.each do |mentioned_id|
      pings << Ping.new(
        pingable_type: mentionable_type,
        pingable_id: mentionable_id,
        pingable_parent_type: mentionable_parent_type,
        pingable_parent_id: mentionable_parent_id,
        pinger_id: mentioned_id,
        user_id: mentioner_id
      )
    end
    Ping.import pings, on_duplicate_key_ignore: true
  end
end
