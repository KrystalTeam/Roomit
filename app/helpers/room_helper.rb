# frozen_string_literal: true

module RoomHelper
  def form_submit_text
    if @room.id.present?
      '更新房源資料'
    else
      '發佈房源'
    end
  end

  def equipment_provided
    res = []
    res << 'Wi-Fi' if @room.has_wifi
    res << '廚房' if @room.has_kitchen
    res << '空調' if @room.has_air_con
    res << '浴缸' if @room.has_bathtub
    res
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
