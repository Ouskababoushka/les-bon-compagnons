class DropBaskets < ActiveRecord::Migration[6.1]
  def change
    drop_table :baskets
  end
end
