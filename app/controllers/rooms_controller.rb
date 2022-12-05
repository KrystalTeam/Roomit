class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path ,notice: "新增成功"
    else
      flash.alert = "新增失敗"
      render :new 
    end  
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to rooms_path ,notice: "更新成功"
    else
      flash.alert = "更新失敗"
      render :new 
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.delete
    redirect_to rooms_path ,notice: "刪除成功"
  end

  private
  def room_params
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms,:has_bathtub, :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time)
  end

end