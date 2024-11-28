class CreateMarketPlaces < ActiveRecord::Migration[8.0]
  def change
    create_table :market_places do |t|
      t.string :marketplace_name

      t.timestamps
    end
  end
end
