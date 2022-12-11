class EditBookingModel < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :state, 0
    change_column_null :bookings, :start_at, true
    change_column_null :bookings, :end_at, true
    change_column_null :bookings, :price_per_night, true
  end
end
