class RemoveTotalPriceFromOrders < ActiveRecord::Migration[6.1]
  def change
    remove_column :orders, :total_price, :float
  end
end
