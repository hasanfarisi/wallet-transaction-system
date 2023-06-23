# app/helpers/authentication_helper.rb
module AuthenticationHelper
  def authenticate_request!
    if !request.headers['Authorization'] or request.headers['Authorization'].nil?
      return render json: {error: 'Invalid token'}, status: 500
    end
    token = request.headers['Authorization'].split(' ').last

    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)
    @current_user = User.find(decoded_token[0]['user_id'])

  rescue JWT::DecodeError => e

    render json: { error: 'Invalid token' }, status: :unauthorized
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: 'User not found' }, status: :unauthorized
  end

  def current_user
    @current_user
  end

  def current_user_id
    token = request.headers['Authorization'].split(' ').last
    if token.present?
      decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base)
      decoded_token[0]['user_id']
    end
  end
end
