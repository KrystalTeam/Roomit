class Review < ApplicationRecord 
    
    belongs_to :user
    belongs_to :room
    has_many :user_id
    has_many :room_id

    validates :comment, presence: true
    
end
