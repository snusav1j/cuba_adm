class CreateSellProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :sell_products do |t|
      t.integer :product_id
      t.integer :sell_price

      t.timestamps
    end
  end
end
