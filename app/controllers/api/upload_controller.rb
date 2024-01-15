class Api::UploadController < ApplicationController
  before_action :authenticate_user!
  def create
    begin
    response = Cloudinary::Uploader.upload(params[:file],
      :public_id => (0...8).map { (65 + rand(26)).chr }.join)

    render json: {
      image_url: response["url"]
    }
    rescue
      raise "Error uploading image"
    end
  end
end