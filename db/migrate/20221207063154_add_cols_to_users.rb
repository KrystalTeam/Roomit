class AddColsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone_num, :string
    add_column :users, :description, :text
    add_column :users, :role, :integer, default: 0
    add_column :users, :deleted_at, :datetime
  end
end
