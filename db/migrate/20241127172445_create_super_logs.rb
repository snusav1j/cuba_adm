class CreateSuperLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :super_logs do |t|
      t.integer :log_id
      t.integer :user_id
      t.integer :action
      t.integer :log_type

      t.timestamps
    end
  end
end
