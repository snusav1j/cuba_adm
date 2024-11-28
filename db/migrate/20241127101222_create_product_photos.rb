class CreateProductPhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :product_photos do |t|
      t.integer :product_id
      t.string :photo_name

      t.timestamps
    end
  end
end
