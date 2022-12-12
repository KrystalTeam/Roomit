class CreateGuestReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :guest_reviews do |t|
      t.references :booking, null: false, foreign_key: true
      t.integer :rating
      t.text :comment
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
