class Api::UsersController < ApplicationController

  before_action :authenticate_user!
  def attach_thumnb
    render json: { message: 'required thumbnail url' }, status: :unprocessable_entity unless params[:thumbnail].present?
    current_user.thumbnail = params[:thumbnail]
    current_user.save!

    render json: { message: 'Thumbnail attached successfully' }, status: :ok
  end
end
