class AddColumnToSellProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :sell_products, :user_id, :integer
  end
end
