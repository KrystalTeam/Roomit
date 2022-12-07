class Room < ApplicationRecord
  validates :home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time, presence: true

  scope :not_deleted, -> { where(deleted_at: nil) }
end
