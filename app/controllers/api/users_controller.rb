class Api::UsersController < ApplicationController
  protect_from_forgery except: :sample

  def login_user
    username = params[:username]
    password = params[:password]

    user = User.find_by(username: username)
    return render json: {error: 'User not found'} unless user

    jwt_token = User.authenticate(username, password)

    if(jwt_token)
      return render json: {token: jwt_token}
    else
      return render json: {error: "Invalid credentials"}, status: 401
    end
  end

  private
  def user_login_params
    params.permit(:email, :password)
  end

end
