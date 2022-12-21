class AddDefaultToHeadcount < ActiveRecord::Migration[6.1]
  def change
    change_column_default :bookings, :headcount, 1
  end
end
