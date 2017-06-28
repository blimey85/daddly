class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json, :js

  autocomplete :venue, :name, extra_data: [:id, :name, :address, :city, :state, :zipcode], full: true

  def index
    @venues = Venue.all
  end 

  def show
  end 

  def new 
    @venue = Venue.new
  end 

  def edit
  end 

  def create
    @venue = Venue.new(venue_params)
    if @venue.save
      render json: @venue
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

  private
    def set_venue
      @venue = Venue.find(params[:id])
    end 

    def venue_params
      params.require(:venue).permit(:name, :address, :city, :state, :zipcode, :latitude, :longitude, :visibility, :events_id) 
    end 
end
 
