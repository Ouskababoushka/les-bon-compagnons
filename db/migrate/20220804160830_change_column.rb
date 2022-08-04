class ChangeColumn < ActiveRecord::Migration[6.1]
  def change
    change_column :line_items, :quantity, :integer, default: 0
  end
end
