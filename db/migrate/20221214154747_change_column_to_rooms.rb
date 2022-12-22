# frozen_string_literal: true

class ChangeColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    remove_column :rooms, :published_at
    remove_column :rooms, :checkin_start_at
    remove_column :rooms, :checkin_end_at
    remove_column :rooms, :checkout_time
    add_column :rooms, :checkin_start_at, :integer
    add_column :rooms, :checkin_end_at, :integer
    add_column :rooms, :checkout_time, :integer
    add_column :rooms, :published_at, :date
  end
end
