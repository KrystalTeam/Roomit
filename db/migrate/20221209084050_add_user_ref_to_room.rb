# frozen_string_literal: true

class AddUserRefToRoom < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :user
  end
end
