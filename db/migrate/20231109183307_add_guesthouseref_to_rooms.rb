class AddGuesthouserefToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :guesthouse, null: false, foreign_key: true
  end
end
