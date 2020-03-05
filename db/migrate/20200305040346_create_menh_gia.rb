class CreateMenhGia < ActiveRecord::Migration[5.2]
  def change
    create_table :menh_gia do |t|
      t.integer :nha_mang_id
      t.integer :so_tien
      t.float :phan_tram_chiec_khau

      t.timestamps
    end
  end
end
