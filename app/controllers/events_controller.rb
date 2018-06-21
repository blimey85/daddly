class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:edit, :update, :destroy]

  respond_to :html, :json, :js

  # def index
  #   @events = Event.includes(:user).page(params[:page]).per(2)
  #   respond_to do |format|
  #     format.js
  #     format.html
  #   end
  # end
  def index
    fields = [:name, :description, :venues_name, :venues_address, :venues_city, :venues_state, :venues_zipcode]
    if params[:event].present?
      search = params[:event]['search'].presence || '*'
      distance = params[:event]['distance'].presence || '5mi'
    else
      search = '*'
      distance = '5mi'
    end

    @events = if params[:l]
                sw_lat, sw_lng, ne_lat, ne_lng = params[:l].split(',')
                Event.search search.to_s,
                             fields: fields,
                             page: params[:page],
                             per_page: 5,
                             where: {
                               locations: {
                                 top_left: {
                                   lat: ne_lat,
                                   lon: sw_lng
                                 },
                                 bottom_right: {
                                   lat: sw_lat,
                                   lon: ne_lng
                                 }
                               }
                             },
                             order: {
                               _geo_distance: { locations: "#{current_user.latitude},#{current_user.longitude}", order: 'asc', unit: 'mi' }
                             }
              elsif params[:event].present? && params[:event][:search].present?
                Event.search search.to_s,
                             fields: fields,
                             page: params[:page],
                             per_page: 5,
                             where: {
                               locations: {
                                 near: {
                                   lat: current_user.latitude,
                                   lon: current_user.longitude
                                 },
                                 within: distance.to_s
                               }
                             },
                             order: {
                               _geo_distance: { locations: "#{current_user.latitude},#{current_user.longitude}", order: 'asc', unit: 'mi' }
                             }
              else
                Event.search search.to_s,
                             fields: fields,
                             page: params[:page],
                             per_page: 5,
                             order: {
                               _geo_distance: { locations: "#{current_user.latitude},#{current_user.longitude}", order: 'asc', unit: 'mi' }
                             }
              end
  end

  def mine
    @events = Event.where(user: current_user.id).includes(:user).page(params[:page]).per(2)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def rsvp
    @events = Reservation.where(user: current_user.id).includes(:events).page(params[:page]).per(2)
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    # @event = Event.includes(:votes, comments: [:pings, :votes]).find(params[:id])
    @event = Event.includes(:votes, :event_categories).find(params[:id])
    check_user_interactions(@event, current_user.id)
  end

  def new
    @event = Event.new(user_id: current_user.id)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save
    @event_categories = @event.event_categories.build
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
    params.require(:event).permit(:name, :description, :starts_at, :ends_at, :start_date, :start_time, :end_date, :end_time, :rsvp_count, :rsvp_min_limit, :rsvp_max_limit, :waitlist, :waitlist_count, :status, :type, :visibility, :venue_id, :search, :distance, event_category_ids: [])
  end
end
