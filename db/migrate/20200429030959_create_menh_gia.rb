class CreateMenhGia < ActiveRecord::Migration[5.2]
  def change
    create_table :menh_gias do |t|
      t.integer :nha_mang_id
      t.float :phan_tram_chiec_khau
      t.float :so_tien

      t.timestamps
    end
    add_index :menh_gias, :nha_mang_id
  end
end
