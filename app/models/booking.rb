# frozen_string_literal: true

class Booking < ApplicationRecord
  before_validation :generate_serial

  belongs_to :user
  belongs_to :room

  validates :price_per_night, presence: true
  validates :start_at, :end_at, presence: true, availability: true
  validate :end_date_after_start_date

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

    if end_at < start_at
      errors.add(:end_at, "must be after the start date")
    end
  end
end
