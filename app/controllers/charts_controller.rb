class ChartsController < ApplicationController
  skip_before_action :authenticate_user!

  def new_users
    render json: User.group_by_month(:created_at, format: "%b %Y").count
  end

  def events
    render json: Event.group_by_month(:starts_at, format: "%b %Y").count
  end
end