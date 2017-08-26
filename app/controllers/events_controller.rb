class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:edit, :update, :destroy]

  respond_to :html, :json, :js

  def index
    @events = Event.page(params[:page]).per(2)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    # @event = Event.includes(:votes, comments: [:pings, :votes]).find(params[:id])
    @event = Event.includes(:votes).find(params[:id])
    check_user_interactions(@event, current_user.id)
  end

  def new
    @event = Event.new(user_id: current_user.id)
  end

  def edit
  end

  def create
    @event = Event.decant_new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    flash[:notice] = 'Event was successfully updated.'
    respond_with(@event)
  end

  def calendar
    @events = Event.all
    render json: @events
  end

  def destroy
    @event.destroy
    redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :starts_at, :ends_at, :start_date, :start_time, :end_date, :end_time, :rsvp_count, :rsvp_min_limit, :rsvp_max_limit, :waitlist, :waitlist_count, :status, :type, :visibility, :venue_id)
  end
end
