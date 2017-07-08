class CommentsController < ApplicationController
  respond_to :html, :json, :js

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: { message: 'comment successfully added' }, status: 200, adapter: nil
    else
      render json: { error: @comment.errors.full_messages }, status: 422
    end
  end

  def show
    @q = Comment.ransack(
      commentable_type_eq: params[:commentable_type],
      commentable_id_eq: params[:commentable_id]
    )
    @comments = @q.result.includes(:user)
    render json: @comments
  end

  private

  def comment_params
    # params.require(:comment).permit(:r, :commentable_id, :commentable_type, :body, :parent_id, :user_id, :edited_at, :votes_count)
    params.permit(:r, :commentable_id, :commentable_type, :body, :parent_id, :user_id, :edited_at, :votes_count, :created_at, :created_by_current_user, :user_has_upvoted)
  end
end
