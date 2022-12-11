class Roomreview < ApplicationRecord
    validates :reservation_id, presence: true
end
