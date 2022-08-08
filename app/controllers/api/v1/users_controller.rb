class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      user[:api_key] = SecureRandom.hex
      render json: UserSerializer.create_user(user), status: 201
    else
      render json: user.errors.full_messages.to_sentence.to_s, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
