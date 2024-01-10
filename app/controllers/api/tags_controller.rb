class Api::TagsController < ApplicationController
  before_action :authenticate_user!

  def index 
    render json: TagSerializer.new(Tag.all).serializable_hash
  end

  def create
    tag = Tag.new(tag_params)

    if tag.save!
      render json: TagSerializer.new(tag).serializable_hash
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
      render json: TagSerializer.new(@tag).serializable_hash, status: :created
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
