class Room < ApplicationRecord
  validates :home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time, presence: true
  
  enum home_type: [:精品旅店, :飯店, :家庭式旅宿, :公寓式旅店, :青年旅舍, :民宿 , :自然小屋, :渡假村, :日式旅館]

  enum room_type: [:整套房源, :獨立房間, :飯店房間, :合住房間]



  scope :not_deleted, -> { where(deleted_at: nil) }
end
