class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
  
    if user && user.authenticate(params[:password])
      render json: UserSerializer.create_user(user), status: 200
    else
      render json: 'Invalid info', status: 400
    end
  end
end
