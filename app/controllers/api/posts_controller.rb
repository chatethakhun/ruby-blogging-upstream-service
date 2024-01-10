class Api::PostsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  
  def index
    render json: PostSerializer.new(current_user.posts).serializable_hash
  end

  def create 
    post = current_user.posts.new(post_params)

    if post.save!
      render json: PostSerializer.new(post)
    else
      render json: { error: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    post = current_user.posts.find(params[:id])
    post.destroy
  end

  def update
    post = current_user.posts.find(params[:id])
    post.update(post_params)

    render json: PostSerializer.new(post)
  end

  private 

  def post_params
    params.require(:post).permit(:content)
  end
end
