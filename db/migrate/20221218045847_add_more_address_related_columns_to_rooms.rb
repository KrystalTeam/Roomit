class AddMoreAddressRelatedColumnsToRooms < ActiveRecord::Migration[6.1]
  def change
    # 縣市
    add_column :rooms, :city, :string, default: '', null: false
    # 鄉鎮市區
    add_column :rooms, :district, :string, default: '', null: false
  end
end
