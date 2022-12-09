class AddDeletedAtIndexToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :deleted_at
  end
end
