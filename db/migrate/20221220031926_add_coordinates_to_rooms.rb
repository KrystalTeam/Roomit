class AddCoordinatesToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :lat, :decimal, precision: 13, scale: 10
    add_column :rooms, :lng, :decimal, precision: 13, scale: 10
  end
end
