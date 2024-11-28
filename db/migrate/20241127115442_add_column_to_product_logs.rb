class AddColumnToProductLogs < ActiveRecord::Migration[8.0]
  def change
    add_column :product_logs, :user_id, :integer
  end
end
