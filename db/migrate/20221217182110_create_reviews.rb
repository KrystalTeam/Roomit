class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :room_id
      t.integer :rating
      t.text :comment
      t.datetime :deleted_at
      t.string :state

      t.timestamps
    end
  end
end
