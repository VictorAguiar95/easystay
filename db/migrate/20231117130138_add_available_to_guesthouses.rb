class AddAvailableToGuesthouses < ActiveRecord::Migration[7.0]
  def change
    add_column :guesthouses, :available, :boolean, default: true
  end
end
