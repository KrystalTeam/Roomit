# frozen_string_literal: true

class EditStartAndEndAtToNotNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :bookings, :start_at, false
    change_column_null :bookings, :end_at, false
    change_column_null :bookings, :price_per_night, false
  end
end
