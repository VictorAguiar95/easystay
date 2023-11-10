class CreateGuesthouses < ActiveRecord::Migration[7.0]
  def change
    create_table :guesthouses do |t|
      t.string :trade_name
      t.string :corporate_name
      t.string :address
      t.string :neighborhood
      t.string :postal_code
      t.string :city
      t.string :state
      t.string :phone_number
      t.string :email
      t.string :cnpj
      t.boolean :pets_allowed
      t.integer :quantity_rooms

      t.timestamps
    end
  end
end
