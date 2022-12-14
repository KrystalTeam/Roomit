class CreateRoomReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :room_reviews do |t|
      t.integer :booking
      t.integer :accuracy_rating
      t.integer :check_in_rating
      t.integer :cleanliness_rating
      t.integer :communication_rating
      t.integer :location_rating
      t.integer :value_rating
      t.text :comment

      t.timestamps

      rename_column(room_reviews, booking, booking_id)
    end
  end
end
