class Api::TagsController < ApplicationController
  before_action :authenticate_user!

  def index 
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save!
      @tag
    else
      render json: { error: tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def add_to_post
    @post = Post.find(params[:post_id])
    @tag = Tag.find(params[:tag_id])

    if @post.tags.include?(@tag)
      render json: { error: 'Tag already added to the post' }, status: :unprocessable_entity
    else
      @post.tags << @tag
      @tag
    end
  end

  def remove_from_post
    @post = Post.find(params[:post_id])
    @tag = Tag.find(params[:tag_id])

    if @post.tags.include?(@tag)
      @post.tags.delete(@tag)
      render json: { message: 'Tag removed from the post successfully' }
    else
      render json: { error: 'Tag not found on the post' }, status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
