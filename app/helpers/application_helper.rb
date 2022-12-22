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

  def default_avatar
    'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQWNvEE9LlF0GhLP3WpNRyRVWpu8qkyfm1-Vpm5ppxfKeczSjYi'
  end
end
