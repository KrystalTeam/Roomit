class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :home_type, presence: true
      t.string :room_type, presence: true
      t.integer :max_occupancy, presence: true, default:2
      t.integer :bedrooms, presence: true, default:1
      t.integer :bathrooms, presence: true, default:1
      t.text :summary, presence: true
      t.string :address, presence: true
      t.boolean :has_wifi, presence: true, default: false
      t.boolean :has_kitchen, presence: true, default: false
      t.boolean :has_air_con, presence: true, default: false
      t.boolean :has_bathtub, presence: true, default: false
      t.integer :price, presence: true
      t.datetime :published_at, presence: true
      t.time :checkin_start_at, presence: true, default: "15:00:00"
      t.time :checkin_end_at, presence: true, default: "23:59:59"
      t.time :checkout_time, presence: true, default: "12:00:00"
      t.datetime :deleted_at

      t.timestamps
    end
  end
end