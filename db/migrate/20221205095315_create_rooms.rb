class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :max_occupancy
      t.integer :bedrooms
      t.integer :bathrooms
      t.text :summary
      t.string :address
      t.boolean :has_wifi
      t.boolean :has_kitchen
      t.boolean :has_air_con
      t.boolean :has_bathtub
      t.integer :price
      t.datetime :published_at
      t.integer :owner_id
      t.time :checkin_start_at
      t.time :checkin_end_at
      t.time :checkout_time
      t.point :coordinate
      t.datetime :delete_at

      t.timestamps
    end
  end
end