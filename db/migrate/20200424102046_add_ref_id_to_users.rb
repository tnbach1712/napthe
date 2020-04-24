class AddRefIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ref_id, :integer
    add_index :users, :ref_id
  end
end
