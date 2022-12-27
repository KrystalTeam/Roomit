# frozen_string_literal: true

class Room < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  has_many :bookings
  has_many :guests, through: :bookings, source: :users
  has_many :wish_list_rooms
  has_many :liked_users, through: :wish_list_rooms, source: :user
  has_many :reviews

  has_many_attached :photos

  validates :home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :summary, :address, :price,
            :checkin_start_at, :checkin_end_at, :checkout_time, presence: true
  validate :checkin_time_more_then_3_hours

  enum home_type: {
    'boutique_hotel' => 0,
    'hotel' => 1,
    'bed_and_breakfast' => 2,
    'aparthotel' => 3,
    'hostel' => 4,
    'minsu' => 5,
    'nature_lodge' => 6,
    'resort' => 7,
    'ryokan' => 8
  }

  enum room_type: { 'entire_place' => 0, 'private_rooms' => 1, 'hotel_rooms' => 2, 'shared_rooms' => 3 }

  enum checkin_start_at: { "11:00": 11, "12:00": 12, "13:00": 13, "14:00": 14, "15:00": 15, "16:00": 16, "17:00": 17, "18:00": 18 },
       _prefix: :checkin_start_at
  enum checkin_end_at: { "14:00": 14, "15:00": 15, "16:00": 16, "17:00": 17, "18:00": 18, "19:00": 19, "20:00": 20, "21:00": 21, "22:00": 22, "23:00": 23, "半夜": 24 },
       _prefix: :checkin_end_at
  enum checkout_time: { "11:00": 11, "12:00": 12, "13:00": 13, "14:00": 14, "15:00": 15, "16:00": 16 },
       _prefix: :checkout_time

  private

  def checkin_time_more_then_3_hours
    return unless Room.checkin_end_ats[checkin_end_at] - Room.checkin_start_ats[checkin_start_at] < 3

    errors.add(:checkin_end_at, 'checkin time should be more than 3 hours')
  end
end
