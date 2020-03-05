class CreateNhaMangs < ActiveRecord::Migration[5.2]
  def change
    create_table :nha_mangs do |t|
      t.string :ten
      t.float :phan_tram_chiec_khau

      t.timestamps
    end
  end
end
