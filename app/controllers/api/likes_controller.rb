class Api::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @likeable = find_likeable
    @like = current_user.likes.new(likeable: @likeable)

    if @like.save
      render json: { message: 'Like created successfully' }, status: :created
    else
      render json: { error: 'Unable to create the like' }, status: :unprocessable_entity
    end
  end

  private

  def find_likeable
    params[:likeable_type].constantize.find(params[:likeable_id])
  end
end
