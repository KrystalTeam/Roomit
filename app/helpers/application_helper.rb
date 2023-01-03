# frozen_string_literal: true

module ApplicationHelper
  def equipment_provided
    res = []
    res << 'Wi-Fi' if @room.has_wifi
    res << '廚房' if @room.has_kitchen
    res << '空調' if @room.has_air_con
    res << '浴缸' if @room.has_bathtub
    res
  end

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
