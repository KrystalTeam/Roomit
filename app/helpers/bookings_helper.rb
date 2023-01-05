# frozen_string_literal: true

module BookingsHelper
  def rating_percentage(value)
    percentage = value / 5.0 * 100
    number_to_percentage(percentage, precision: 0)
  end
    
  def average(column)
    @room.reviews.average(column).floor(1)
  end
    
  def no_review_bookings_count
    Booking.includes(:reviews).where(user_id: current_user.id,state: 2,reviews:{id: nil}).count
  end
end
