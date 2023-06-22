class Api::TopupHistoriesController < ApplicationController
  before_action :authenticate_request!

  def topup
    amount = params[:amount]
    user_id = current_user_id
    status = 'pending'

    if amount.nil?
      return render json:{error: "Amount cannot be empty"}
    end

    user = User.find_by_id(user_id)

    unless user.wallet
      return render json: {error: "You do not have a wallet, must be created the wallet first"}
    end

    ActiveRecord::Base.transaction do

      wallet = user.wallet
      wallet.update(balance: wallet.balance + amount)
      byebug
      new_topup = TopupHistory.new(user_id: user_id, amount: amount, status: status);
      if new_topup.save
        return render json:{data: new_topup}
      else
        return render json:{error: "Topup failed"}
      end
    end

  end
end
