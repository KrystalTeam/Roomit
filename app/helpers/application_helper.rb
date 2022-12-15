module ApplicationHelper
  def equipment_provided
    res=[]
    if @room.has_wifi
      res << "Wi-Fi"
    end
    if @room.has_kitchen
      res << "廚房"
    end
    if @room.has_air_con
      res << "空調"
    end
    if @room.has_bathtub
      res << "浴缸"
    end
    res
  end
end