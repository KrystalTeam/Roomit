# frozen_string_literal: true

class CreateWishListRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :wish_list_rooms do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
