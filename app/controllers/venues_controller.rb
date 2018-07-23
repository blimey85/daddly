class VenuesController < ApplicationController
  before_action :set_venue, only: [:edit, :update, :destroy]
  respond_to :html, :json, :js

  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.includes(:past_events, :future_events).find(params[:id])
  end

  def new
    @venue = Venue.new
  end

  def edit
  end

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      render json: @venue, status: :ok
    else
      render json: { error: @venue.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @venue.update(venue_params)
    flash[:notice] = 'Venue was successfully updated.'
    respond_with(@venue)
  end

  def destroy
    @venue.destroy
    redirect_to venues_url, notice: 'Venue was successfully destroyed.'
  end

  # uses Ransack for search
  # uses ActiveModel Serializer VenueSearchSerializer for decorating
  # @return :id, :name, :full_address [:address, :city, :state, :zipcode]
  def search
    @venues = Venue.ransack(name_cont: params[:r]).result(distinct: true)
    render json: @venues, each_serializer: VenueSearchSerializer
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:r, :name, :address, :city, :state, :zipcode, :latitude, :longitude, :visibility, :events_id)
  end
end
