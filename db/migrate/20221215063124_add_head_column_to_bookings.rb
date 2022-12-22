# frozen_string_literal: true

class AddHeadColumnToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :headcount, :integer
  end
end
