class Api::TopupHistoriesController < ApplicationController
  before_action :authenticate_request!

  def topup
    begin
      amount = params[:amount]
      user_id = current_user_id
      status = 'success'

      if amount.nil?
        return render json: { error: "Amount cannot be empty" }
      end

      user = User.find_by_id(user_id)

      unless user.wallet
        return render json: { error: "You do not have a wallet, must be created the wallet first" }
      end

      ActiveRecord::Base.transaction do
        wallet = user.wallet
        wallet.update(balance: wallet.balance + amount)

        new_topup = TopupHistory.create(user_id: user_id, amount: amount, status: status)
        unless new_topup.persisted?
          raise ActiveRecord::Rollback
        end

        render json: { data: new_topup }
      end
    rescue StandardError => e
      render json: { error: e.message }, status: 500
    end
  end


  private
  def topup_params
    params.permit(:user_id, :amount, :status)
  end
end
