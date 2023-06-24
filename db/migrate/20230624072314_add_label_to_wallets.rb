class AddLabelToWallets < ActiveRecord::Migration[7.0]
  def change
    add_column :wallets, :label, :string
  end
end
