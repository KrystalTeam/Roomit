# frozen_string_literal: true

module RoomHelper
  def form_submit_text
    if @room.id.present?
      '更新房源資料'
    else
      '發佈房源'
    end
  end


  def to_twd(number)
    number_to_currency( number, negative_format: "(%u%n)",precision:0,unit: "$")
  end

  def bookings_start_to_end(booking)
    if booking.start_at.year == booking.end_at.year
      "#{booking.start_at.strftime('%Y-%m-%d')} ~ #{booking.end_at.strftime('%m-%d')}"
    else
      "#{booking.start_at.strftime('%Y-%m-%d')} ~ #{booking.end_at.strftime('%Y-%m-%d')}"
    end
  end
end
