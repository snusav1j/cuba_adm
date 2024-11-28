class CreateProductLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :product_logs do |t|
      t.integer :product_id
      t.integer :action

      t.timestamps
    end
  end
end
