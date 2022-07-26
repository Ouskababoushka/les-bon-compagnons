class RemoveProductsIdFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :products_id, :bigint
  end
end
