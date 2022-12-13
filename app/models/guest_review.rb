class GuestReview < ApplicationRecord
  acts_as_paranoid

  belongs_to :booking
  validates :comment, presence: true
end
