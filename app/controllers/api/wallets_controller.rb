class Api::WalletsController < ApplicationController
  before_action :authenticate_request!

  def create
    user_id = current_user_id
    label = params[:label]

    if label.nil? or label == ""
      label = 'My wallet'
    end

    user = User.find_by_id(user_id)
    if user.wallet
      return render json: { error: "You are already have wallet" }
    end

    new_wallet = Wallet.new(balance: 0, user_id: user_id, label: label)
    if new_wallet.save
      return render json:{message: new_wallet}
    end
  end
end
