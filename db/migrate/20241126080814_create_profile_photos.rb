class CreateProfilePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :profile_photos do |t|
      t.integer :user_id
      t.string :photo_url
      t.string :photo_name

      t.timestamps
    end
  end
end
