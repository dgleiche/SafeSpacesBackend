class CreateAccessibilityInformations < ActiveRecord::Migration[5.2]
  def change
    create_table :accessibility_informations do |t|
      t.float :score
      t.boolean :gen_accessible
      t.boolean :ramps
      t.boolean :smooth
      t.boolean :elevators
      t.boolean :description
      t.boolean :brail
      t.boolean :sound
      t.float :sound_measure
      t.boolean :automatic_doors
      t.boolean :parking
      t.boolean :bathrooms
      t.boolean :sight_impaired
      t.string :photos, array: true
      t.float :door_widths, array: true
      t.float :table_heights, array: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
