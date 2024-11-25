class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :role
      t.string :email
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
