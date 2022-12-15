class Booking < ApplicationRecord

  before_validation :generate_serial

  belongs_to :user
  belongs_to :room
  has_many :room_review

  validates :start_at, :end_at, :price_per_night, presence: true

  enum state: %i[pending unpaid paid cancelled]

  private
  def generate_serial
    self.serial = SecureRandom.alphanumeric(13)
  end
end
