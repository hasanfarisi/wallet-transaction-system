class Api::WalletsController < ApplicationController
  before_action :authenticate_request!

  def create
    user_id = current_user_id

    new_wallet = Wallet.new(balance: 0, user_id: user_id)
    if new_wallet.save
      return render json:{message: new_wallet}
    end
  end
end
