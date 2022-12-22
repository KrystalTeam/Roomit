# frozen_string_literal: true

class AddSerialToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :serial, :string
  end
end
