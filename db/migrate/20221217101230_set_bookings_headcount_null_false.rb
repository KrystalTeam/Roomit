# frozen_string_literal: true

class SetBookingsHeadcountNullFalse < ActiveRecord::Migration[6.1]
  def change
    change_column_null :bookings, :headcount, false
  end
end
