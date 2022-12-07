class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :home_type, null: false
      t.integer :room_type, null: false
      t.integer :max_occupancy, null: false, default: 2
      t.integer :bedrooms, null: false, default: 1
      t.integer :bathrooms, null: false, default: 1
      t.text :summary, null: false
      t.string :address, null: false
      t.boolean :has_wifi, null: false, default: false
      t.boolean :has_kitchen, null: false, default: false
      t.boolean :has_air_con, null: false, default: false
      t.boolean :has_bathtub, null: false, default: false
      t.integer :price, null: false
      t.datetime :published_at
      t.time :checkin_start_at, null: false, default: '15:00:00'
      t.time :checkin_end_at, null: false, default: '23:59:59'
      t.time :checkout_time, null: false, default: '12:00:00'
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
