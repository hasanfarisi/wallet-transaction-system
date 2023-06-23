class CreateTransferHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :transfer_histories do |t|
      t.integer :amount
      t.integer :user_id
      t.integer :target_user_id
      t.string :status
      t.timestamps
    end
    add_index :transfer_histories, :user_id
    add_index :transfer_histories, :target_user_id
  end
end
