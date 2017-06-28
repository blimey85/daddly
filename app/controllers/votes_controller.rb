class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json, :js

  def index
    @votes = Vote.all
  end 

  def show
  end 

  def new 
    @vote = Vote.new
  end 

  def edit
  end 

  def create
    @vote = Vote.new(vote_params)
    @vote.save
    respond_with(@vote)
  end 

  def update
    @vote.update(vote_params)
    flash[:notice] = 'Vote was successfully updated.'
    respond_with(@vote)
  end 

  def destroy
    @vote.destroy
    redirect_to votes_url, notice: 'Vote was successfully destroyed.'
  end 

  private
    def set_vote
      @vote = Vote.find(params[:id])
    end 

    def vote_params
      params.require(:vote).permit(:votable_id, :votable_type, :user) 
    end 
end
 
