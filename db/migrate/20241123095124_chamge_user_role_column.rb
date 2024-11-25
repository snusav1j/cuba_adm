class ChamgeUserRoleColumn < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :role, :integer
  end
end
