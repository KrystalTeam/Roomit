class Booking < ApplicationRecord
  has_many :users
  has_many :rooms

  enum state: %i[pending unpaid paid cancelled]
end
