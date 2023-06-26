class CreateTransactionHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :transaction_histories do |t|
      t.string :type, null: false
      t.integer :amount, null: false
      t.integer :user_id, null: false
      t.integer :target_user_id
      t.string :status, null:  false
      t.timestamps
    end
    add_index :transaction_histories, :user_id
    add_index :transaction_histories, :type
    add_index :transaction_histories, :status
  end
end
