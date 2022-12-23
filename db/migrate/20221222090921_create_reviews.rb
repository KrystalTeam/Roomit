class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.integer :guest_rating, null: true
      t.integer :accuracy_rating, null: true
      t.integer :check_in_rating, null: true
      t.integer :cleanliness_rating, null: true
      t.integer :communication_rating, null: true
      t.integer :location_rating, null: true
      t.integer :value_rating, null: true
      t.string :comment, null: true
      t.string :review_to, null: false
      t.timestamps
    end
  end
end
