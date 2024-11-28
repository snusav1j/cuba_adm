class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.string :description
      t.integer :author_id
      t.integer :available
      t.integer :marketplace
      t.integer :buy_price
      t.integer :sold
      t.integer :sell_price

      t.timestamps
    end
  end
end
