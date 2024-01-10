class Api::CommentsController < ApplicationController
  before_action :authenticate_user!, :set_post

  def index
    comments = @post.comments

    render json: comments, each_serializer: CommentSerializer
  end

  def create
    comment = @post.comments.new(comment_params)
    comment.user = current_user
    if comment.save!
      render json: comment, serializer: CommentSerializer
    else
      render json: { error: comment.errors.full_messages }, status: :unprocessable_entity
    end
    
  end

  def update
    comment = @post.comments.find(params[:id])
    comment.update(comment_params)

    render json: comment, serializer: CommentSerializer
  end

  def destroy
    comment = @post.comments.find(params[:id])
    comment.destroy
  end

  private

  def set_post
    @post = current_user.posts.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
