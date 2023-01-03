# frozen_string_literal: true

class Booking < ApplicationRecord
  before_validation :generate_serial
  belongs_to :user
  belongs_to :room
  has_many :reviews
  

  validates :price_per_night, presence: true
  validates :start_at, :end_at, presence: true
  validate :end_date_after_start_date, :other_booking_during_the_period

  enum state: %i[pending unpaid paid cancelled past]


  private

  def generate_serial
    self.serial = SecureRandom.alphanumeric(13)
  end

  def paid
    scope :state, -> { where state: 2 }
  end

  def past
    scope :state, -> { where state: 4 }
  end

  def cancelled
    scope :state, -> { where state: 3 }
  end

  def end_date_after_start_date
    return if end_at.blank? || start_at.blank?

    errors.add(:end_at, 'must be after the start date') if end_at < start_at
  end

  def other_booking_during_the_period
    return unless disable_dates(Room.find(room_id)).intersect?((start_at..(end_at - 1)).to_a)

    errors.add(:end_at, 'already booked by someone else')
  end

  def disable_dates(room)
    disabledates = []
    room.bookings.paid.map do |booking|
      (booking.start_at..booking.end_at.yesterday).map do |disabledate|
        disabledates << disabledate
      end
      disabledates.flatten
    end
  end
end
