class Room < ApplicationRecord
  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :max_occupancy, presence: true
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true
  validates :summary, presence: true
  validates :address, presence: true
  validates :price, presence: true
  validates :checkin_start_at, presence: true
  validates :checkin_end_at, presence: true
  validates :checkout_time, presence: true
  validate :checkin_time_should_more_than_three_hours

  scope :not_deleted,  -> { where(deleted_at: nil) }

  private
  def checkin_time_should_more_than_three_hours
    if checkin_end_at.to_i - checkin_start_at.to_i < 3
      errors.add(:checkin_end_at, "Checkin time should more than three hours")
    end
  end
end