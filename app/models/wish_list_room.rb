# frozen_string_literal: true

class WishListRoom < ApplicationRecord
  belongs_to :user
  belongs_to :room
end
