require 'jwt'
class User < ApplicationRecord

  has_many :topup_histories, foreign_key: :user_id
  has_one :wallet, foreign_key: :user_id
  has_many :transfer_histories, foreign_key: :user_id

  def self.authenticate(username, password)
    user = find_by(username: username)
    jwt_payload = {user_id: user.id, password: password}
    jwt_token = JWT.encode(jwt_payload, Rails.application.secrets.secret_key_base)
  end

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
end
