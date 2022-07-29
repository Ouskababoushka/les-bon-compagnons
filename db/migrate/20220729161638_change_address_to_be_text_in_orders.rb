class ChangeAddressToBeTextInOrders < ActiveRecord::Migration[6.1]
  def change
    change_column :orders, :address, :text
  end
end
