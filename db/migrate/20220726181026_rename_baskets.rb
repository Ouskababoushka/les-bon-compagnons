class RenameBaskets < ActiveRecord::Migration[6.1]
  def change
    rename_table :baskets, :carts
  end
end
