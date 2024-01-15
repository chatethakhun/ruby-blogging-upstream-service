class Api::UploadController < ApplicationController
  before_action :authenticate_user!
  def create
    response = HTTParty.post("https://file.io",
      body: { file: params[:file] },
      headers: { 'Content-Type' => 'multipart/form-data', 'Authorization' => "Bearer #{Rails.application.credentials.file_io_api_key}" })

    begin
      result = JSON.parse(response.body)
      if result["success"]
        render json: {
          link: result["link"]
        }
      else
        raise "Upload failed: #{result['message']}"
      end
    rescue
      raise "Invalid response received from the server."
    end
  end
end