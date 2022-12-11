class CreateRoomreviews < ActiveRecord::Migration[6.1]
  def change
    create_table :roomreviews do |t|
      t.integer :reservation_id
      t.integer :accuracy_rating
      t.integer :check_in_rating
      t.integer :cleanliness_rating
      t.integer :communication_rating
      t.integer :location_rating
      t.integer :value_rating
      t.text :comment

      t.timestamps
    end
  end
end
