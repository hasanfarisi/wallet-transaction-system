class CreateTopupHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :topup_histories do |t|
      t.integer :amount
      t.integer :user_id
      t.string :status

      t.timestamps
    end
    add_index :topup_histories, :user_id
  end
end
