class AddCepToGuesthouse < ActiveRecord::Migration[7.0]
  def change
    add_column :guesthouses, :cep, :string
  end
end
