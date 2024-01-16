class Api::UsersController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  def upload_attachment
    render json: { message: 'required thumbnail url' }, status: :unprocessable_entity unless params[:thumbnail_url].present?
    current_user.thumbnail = params[:thumbnail_url]
    current_user.save!

    render json: { message: 'Thumbnail attached successfully' }, status: :ok
  end


  def update
    current_user.update!(user_params)

    @user = current_user
  end

  private 

  def user_params
    params.require(:user).permit(:name, :thumbnail)
  end
end
