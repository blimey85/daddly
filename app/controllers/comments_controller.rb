class CommentsController < ApplicationController
  respond_to :json, :js

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment
    else
      render json: { error: @comment.errors.full_messages }, status: 422
    end
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    render json: @comment
  end

  def show
    @query = Comment.ransack(
      commentable_type_eq: params[:commentable_type],
      commentable_id_eq: params[:commentable_id]
    )
    @comments = @query.result.includes(:user)
    render json: @comments
  end

  private

  def comment_params
    params.permit(:r, :id, :commentable_id, :commentable_type, :body, :parent_id, :user_id, :edited_at, :votes_count, :created_at, :created_by_current_user, :user_has_upvoted)
  end
end
