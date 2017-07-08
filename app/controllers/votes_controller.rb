class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      # render json: { message: 'Vote was successfully added.' }, status: 200, adapter: nil
      render json: { message: 'Vote was successfully added.' }, status: 200, adapter: nil
    else
      render json: { error: @vote.errors.full_messages }, status: 422
    end
  end

  def destroy
    @votes = Vote.where('votable_type = ? and votable_id = ? and user_id = ?', params['votable_type'], params['votable_id'], params['user_id']).limit(1)
    if Vote.destroy(@votes.first.id)
      render json: { message: 'Vote was successfully destroyed.' }, status: 200, adapter: nil
    else
      render json: { error: @votes.errors.full_messages }, status: 422
    end
  end

  private

  def vote_params
    params.permit(:votable_id, :votable_type, :user_id)
  end
end
