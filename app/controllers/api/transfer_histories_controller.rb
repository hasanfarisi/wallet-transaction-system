class Api::TransferHistoriesController < ApplicationController
  before_action :authenticate_request!

  def transfer
    begin
      amount = params[:amount]
      user_id = current_user_id
      target_user_id = params[:target_user_id]
      status = 'success'

      if amount.nil?
        return render json: { error: "Amount cannot be empty" }
      end

      if target_user_id.nil?
        return render json: { error: "Target cannot be empty" }
      end

      user = User.find_by_id(user_id)

      unless user.wallet
        return render json: { error: "You do not have a wallet, must be created the wallet first" }
      end
      if user.wallet.balance < amount
        byebug
        return render json: { error: "Your balance has not enough to transfer" }
      end

      target_user = User.find_by_id(target_user_id)

      unless target_user.wallet
        return render json: { error: "Your target do not have a wallet, make sure your target has a wallet" }
      end

      ActiveRecord::Base.transaction do
        wallet = user.wallet
        wallet.update(balance: wallet.balance - amount)
        target_wallet = target_user.wallet
        target_wallet.update(balance: target_wallet.balance + amount)

        new_transfer = TransferHistory.create(user_id: user_id, target_user_id: target_user_id, amount: amount, status: status)
        unless new_transfer.persisted?
          raise ActiveRecord::Rollback
        end

        render json: { data: new_transfer }
      end
    rescue StandardError => e
      render json: { error: e.message }, status: 500
    end
  end

end
