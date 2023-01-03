class ChangeColumnToReviews < ActiveRecord::Migration[6.1]
  def change
    add_reference :reviews, :booking, foreign_key: true
    add_reference :reviews, :room, foreign_key: true
  end
end
