class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.integer :user_id
      t.integer :balance
      t.timestamps
    end
    add_index :wallets, :user_id
  end
end
