class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.float :lat
      t.float :long
      t.integer :google_place_id
      t.references :location_type, foreign_key: true

      t.timestamps
    end
  end
end
