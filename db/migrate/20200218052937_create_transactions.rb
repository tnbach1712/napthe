class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :number
      t.string :serial
      t.string :remote_transaction_id
      t.string :status
      t.string :account_name
      t.string :game_name

      t.timestamps
    end
  end
end
