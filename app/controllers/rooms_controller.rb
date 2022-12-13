class RoomsController < ApplicationController
  before_action :find_rooms, only: [:edit, :update, :destroy, :show, :destroy_photo]

  def index
    @rooms = Room.all.not_deleted
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.not_deleted.new(room_params)
    if @room.save
      redirect_to rooms_path, notice: '新增成功'
    else
      flash.alert = "新增失敗"
      render :new
    end
  end

  def show
    @user = current_user
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
      redirect_to rooms_path, notice: '更新成功'
    else
      flash.alert = '更新失敗'
      render :edit
    end
  end

  def destroy
    @room.update(deleted_at: Time.current)
    redirect_to rooms_path, notice: "已刪除"
  end

  def destroy_photo
    @room.photos.find(params[:photo_id]).purge_later
    respond_to do |format|
      format.html { render :edit, notice: '圖片已刪除' }
      format.json { head :no_content }
    end
  end

  def destroy_photo
    @room.photos.find(params[:photo_id]).purge_later
    respond_to do |format|
      format.html { render :edit, notice: '圖片已刪除' }
      format.json { head :no_content }
    end
  end

  def destroy_photo
    @room.photos.find(params[:photo_id]).purge_later
    respond_to do |format|
      format.html { render :edit, notice: '圖片已刪除' }
      format.json { head :no_content }
    end
  end

  private

  def find_room
    @room = Room.not_deleted.find(params[:id])
  end

  def room_params
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub, :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time, photos:[])
=======
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub, :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time, avatars:[])
>>>>>>> a69000c (active storage install /add room relationship)
=======
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub, :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time, avatars:[])
>>>>>>> 1826036 (active storage install /add room relationship)
  end

  def room_params_without_photos
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub, :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time)
=======
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub, :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time, photos:[])
>>>>>>> d60cc75 (AWS S3 linked)
  end
=======
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub, :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time, photos:[])
  end
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 3468809 (AWS S3 linked)
=======
=======
>>>>>>> a022e6e (delete photo in room_edit OK)

  def room_params_without_photos
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub, :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time)
  end
<<<<<<< HEAD
>>>>>>> 4e15191 (delete photo in room_edit OK)
=======
>>>>>>> a022e6e (delete photo in room_edit OK)
end
