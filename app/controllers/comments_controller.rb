class CommentsController < ApplicationController
  respond_to :json, :js

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      mentions_add(
        comment_params['mentions'].uniq,
        'Comment',
        @comment.id,
        current_user.id,
        comment_params['commentable_type'],
        comment_params['commentable_id']
      )
      render json: @comment
    else
      render json: { error: @comment.errors.full_messages }, status: :unprocessable_entity
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
    @comments = @query.result.includes(:user, :votes, pings: :user)
    render json: @comments
  end

  private

  def comment_params
    params.permit(:r, :id, :commentable_id, :commentable_type, :body, :parent_id, :user_id, :edited_at, :votes_count, :created_at, :created_by_current_user, :user_has_upvoted, mentions: [])
  end
end
