class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :number
      t.integer :loai_thanh_toan
      t.integer :so_tien
      t.text :note
      t.text :preferences

      t.timestamps
    end
  end
end
