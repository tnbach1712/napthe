class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :order_id
      t.integer :status
      t.string :menh_gia
      t.text :note
      t.text :preferences

      t.timestamps
    end
  end
end
