# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :start_at
      t.date :end_at
      t.integer :price_per_night
      t.integer :state

      t.timestamps
    end
  end
end
