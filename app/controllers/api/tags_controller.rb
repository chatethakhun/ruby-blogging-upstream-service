class Api::TagsController < ApplicationController
  before_action :authenticate_user!

  def index 
    render json: TagSerializer.new(Tag.all).serializable_hash
  end

  def create
    tag = Tag.new(tag_params)

    if tag.save!
      render json: TagSerializer.new(tag)
    else
      render json: { error: tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
