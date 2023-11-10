class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.text :description
      t.integer :size
      t.integer :qty_people
      t.boolean :bathroom
      t.boolean :balcony
      t.boolean :wi_fi
      t.boolean :air_conditioning
      t.boolean :television
      t.boolean :wardrobe
      t.boolean :safe
      t.boolean :accessible_disabled
      t.boolean :available

      t.timestamps
    end
  end
end
