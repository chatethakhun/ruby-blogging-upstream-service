class Api::PostsController < ApplicationController
  respond_to :json
  before_action :authenticate_user!
  
  def index
    render json: Post.all
  end
end
