class ChangeSomeName < ActiveRecord::Migration[6.1]
  def change
    rename_column :line_items, :basket_id, :cart_id
  end
end
