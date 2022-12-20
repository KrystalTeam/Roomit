class RoomsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_hosted_rooms, only: [:manage]
  before_action :find_all_rooms, only: [:index]
  before_action :find_room, only: [:show,:wish_list]
  before_action :find_hosted_room, only: [:edit, :update, :destroy, :destroy_photo]


  def index
      @rooms = Room.all.not_deleted
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.not_deleted.new(room_params)

    @geocoding_obj = GoogGeocodingApi.new(@room.address)
    @coordinates = @geocoding_obj.get_response
    @room.lat = get_lat(@coordinates)
    @room.lng = get_lng(@coordinates)
    
    if @room.save
      redirect_to manage_rooms_path, notice: '新增成功'
    else
      flash.alert = "新增失敗"
      render :new
    end
  end

  def show
    @booking = Booking
  end

  def edit
  end

  def update
    if params[:room][:photos].present?
      params[:room][:photos].each do |photo|
        @room.photos.attach(photo)
      end
    end
    if @room.update(room_params_without_photos)
      redirect_to manage_rooms_path, notice: '更新成功'
    else
      flash.alert = '更新失敗'
      render :edit
    end
  end

  def destroy
    @room.update(deleted_at: Time.current)
    redirect_to manage_rooms_path, notice: "已刪除"
  end

  def destroy_photo
    @room.photos.find(params[:photo_id]).purge_later
    respond_to do |format|
      format.html { render :edit, notice: '圖片已刪除' }
      format.json { head :no_content }
    end
  end

  def manage
  end

  def wish_list
    if current_user.liked_wish_list_rooms.include?(@room)
      current_user.liked_wish_list_rooms.delete(@room)
      render json: {status: "unliked"}
    else
      current_user.liked_wish_list_rooms << (@room)
      render json: {status: "liked"}
    end
  end

  def wish_list_rooms
    
  end

  private

  def find_room
    @room = Room.find(params[:id])
  end

  def find_hosted_rooms
    @rooms = current_user.rooms.not_deleted
  end

  def find_hosted_room
    @room = current_user.rooms.not_deleted.find(params[:id])
  end 

  def find_all_rooms
    @rooms = Room.all.not_deleted
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub, :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time, photos:[])
  end

  def room_params_without_photos
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub, :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time)
  end
end
