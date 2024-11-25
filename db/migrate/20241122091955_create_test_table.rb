class CreateTestTable < ActiveRecord::Migration[8.0]
  def change
    create_table :test_tables do |t|
      t.timestamps
      t.integer :test_number
    end
  end
end
