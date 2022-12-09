module RoomHelper

  def form_submit_text
    if @room.id.present?
      '更新房源資料'
    else
      '新增房源'
    end
  end

end
