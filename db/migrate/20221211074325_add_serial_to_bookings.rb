class AddSerialToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :serial, :string
  end
end
