class Api::UsersController < ApplicationController
  # protect_from_forgery except: :sample
  before_action :authenticate_request!, only: [:show_profile]


  def login_user
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    return render json: {error: 'User not found'}, status: 404 unless user

    jwt_token = User.authenticate(username, password)

    unless jwt_token
      return render json: {error: "Invalid credentials"}, status: 401
    end

    return render json: {token: jwt_token}
  end

  def show_profile
    user = User.includes(:wallet).find_by_id(current_user_id)

    unless user
      render json: {error: "Not found"}, status: 404
      return
    end

    return render json: {user: user.as_json(include: :wallet).except('password')}
  end

  private
  def user_login_params
    params.permit(:email, :password)
  end

end
