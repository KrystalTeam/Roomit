# frozen_string_literal: true

module RoomHelper
  def form_submit_text
    if @room.id.present?
      '更新房源資料'
    else
      '新增房源'
    end
  end


  def  to_twd(number)
    number_to_currency( number, negative_format: "(%u%n)",precision:0,unit: "$")
  end
end
