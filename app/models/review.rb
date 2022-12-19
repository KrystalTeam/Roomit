class Review < ApplicationRecord 
    belongs_to :user
    belongs_to :room
    validates :comment, presence: true
    
end