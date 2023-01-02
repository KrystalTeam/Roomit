# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :booking
  belongs_to :room
  scope :no_reviews, -> { where(reviews_count: 0)}
  enum review_to: {
    'room' => 'room',
    'guest' => 'guest'
  }, _prefix: :review_to
  enum guest_rating: {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5
  }, _prefix: :guest_rating
  enum accuracy_rating: {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5
  }, _prefix: :accuracy_rating
  enum check_in_rating: {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5
  }, _prefix: :check_in_rating
  enum cleanliness_rating: {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5
  }, _prefix: :cleanliness_rating
  enum communication_rating: {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5
  }, _prefix: :comumunication_rating
  enum location_rating: {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5
  }, _prefix: :location_rating
  enum value_rating: {
    '1' => 1,
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5
  }, _prefix: :value_rating
end
