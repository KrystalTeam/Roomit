# frozen_string_literal: true

class RoomsController < ApplicationController
  require 'mini_magick'

  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :find_hosted_rooms, only: [:manage]
  before_action :find_all_rooms, only: [:index]
  before_action :find_room, only: %i[show wish_list]
  before_action :find_hosted_room, only: %i[edit update destroy destroy_photo]
  before_action :should_compelete_user_info, only: [:new]

  def index
  end

  def new
    @room = Room.new
  end

  def create
    @room = current_user.rooms.new(room_params)

    @geocoding_obj = GoogGeocodingApi.new(@room.address)
    @coordinates = @geocoding_obj.get_response

    if @coordinates.nil?
      flash.alert = '請輸入有效的地址'
      render :new
    else
      @room.lat = @geocoding_obj.get_lat(@coordinates)
      @room.lng = @geocoding_obj.get_lng(@coordinates)

      if @room.save
        redirect_to manage_rooms_path, notice: '新增成功'
      else
        flash.alert = '新增失敗'
        render :new
      end
    end
  end

  def show
    @bookings = Booking.where(room_id: @room.id)
    @disable_dates = disable_dates(@room).flatten

    @places_obj = GoogPlacesApi.new("#{@room.lat}%2C#{@room.lng}")
    @tourist_attractions = @places_obj.get_tourist_attractions
    @restaurants = @places_obj.get_restaurants
    @bars = @places_obj.get_bars
  end

  def edit; end

  def update
    if params[:room][:photos].present?
      params[:room][:photos].each do |photo|
        @room.photos.attach(photo)
      end
    end

    @geocoding_obj = GoogGeocodingApi.new(params[:room][:address])
    @coordinates = @geocoding_obj.get_response

    if @coordinates.nil?
      flash.alert = '請輸入有效的地址'
      render :edit
    else
      if @room.update(room_params_without_photos)
        @room.update(
          lat: @geocoding_obj.get_lat(@coordinates),
          lng: @geocoding_obj.get_lng(@coordinates)
        )
  
        redirect_to manage_rooms_path, notice: '更新成功'
      else
        flash.alert = '更新失敗'
        render :edit
      end
    end
  end

  def destroy
    @room.destroy
    redirect_to manage_rooms_path, notice: '已刪除'
  end

  def destroy_photo
    @room.photos.find(params[:photo_id]).purge_later
    respond_to do |format|
      format.html { render :edit, notice: '圖片已刪除' }
      format.json { head :no_content }
    end
  end

  def manage
    @bookings_query = current_user.bookings_to_hosted_rooms.where(state: [2, 4]).includes([:room]).includes([:user]).ransack(params[:q])
    @bookings = @bookings_query.result.order(:created_at).reverse_order


    monthly_income_data_query = <<-SQL
    SELECT  b.end_at, SUM(b.price_per_night * (b.end_at - b.start_at)) 
    FROM rooms AS r
    LEFT JOIN bookings AS b
      ON r.id = b.room_id
    WHERE r.user_id = #{current_user.id}
      AND b.id IS NOT NULL
      AND b.start_at >= DATE_TRUNC('month', NOW())::DATE
      AND b.end_at <= (DATE_TRUNC('month', NOW()::DATE) + INTERVAL '1 month' - INTERVAL '1 day')::DATE
      AND b.state IN (2, 4)
    GROUP BY b.end_at;
    SQL
    monthly_paid_income_query = <<-SQL
      SELECT  SUM(b.price_per_night * (b.end_at - b.start_at)) 
      FROM rooms AS r
      LEFT JOIN bookings AS b
        ON r.id = b.room_id
      WHERE r.user_id = #{current_user.id}
        AND b.id IS NOT NULL
        AND b.start_at >= DATE_TRUNC('month', NOW())::DATE
        AND b.end_at <= (DATE_TRUNC('month', NOW()::DATE) + INTERVAL '1 month' - INTERVAL '1 day')::DATE
        AND b.state = 2;
    SQL
    monthly_past_income_query = <<-SQL
      SELECT  SUM(b.price_per_night * (b.end_at - b.start_at)) 
      FROM rooms AS r
      LEFT JOIN bookings AS b
        ON r.id = b.room_id
      WHERE r.user_id = #{current_user.id}
        AND b.id IS NOT NULL
        AND b.start_at >= DATE_TRUNC('month', NOW())::DATE
        AND b.end_at <= (DATE_TRUNC('month', NOW()::DATE) + INTERVAL '1 month' - INTERVAL '1 day')::DATE
        AND b.state = 4;
    SQL
    
    @monthly_income_data = ActiveRecord::Base.connection.execute(monthly_income_data_query).values

    @monthly_paid_income_result = ActiveRecord::Base.connection.execute(monthly_paid_income_query).values.flatten.first
    @monthly_paid_income = @monthly_paid_income_result.nil? ? 0 : @monthly_paid_income_result
    
    @monthly_past_income_result = ActiveRecord::Base.connection.execute(monthly_past_income_query).values.flatten.first
    @monthly_past_income = @monthly_past_income_result.nil? ? 0 : @monthly_past_income_result
      # dashbord end
  end

  def wish_list
    if current_user.liked_wish_list_rooms.include?(@room)
      current_user.liked_wish_list_rooms.delete(@room)
      render json: { status: 'unliked' }
    else
      current_user.liked_wish_list_rooms << (@room)
      render json: { status: 'liked' }
    end
  end

  def wish_list_rooms
    @rooms = current_user.liked_wish_list_rooms.includes(:reviews,:photos_attachments)
    @photos = current_user.liked_wish_list_rooms.includes([:photos_attachments])&.first&.photos
    @data = @rooms.select(:id, :lat, :lng)
  end

  private
  
  def find_room
    @room = Room.includes(:photos_attachments,:reviews,photos_attachments: :blob).find(params[:id])
  end

  def find_hosted_rooms
    @rooms = current_user.rooms.includes(:photos_attachments,photos_attachments: :blob)
  end

  def find_hosted_room
    @room = current_user.rooms.find(params[:id])
  end

  def find_all_rooms
    @rooms = Room.includes(:photos_attachments, :reviews,photos_attachments: :blob).reverse_order
  end

  def room_params
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub,
                                 :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time, photos: [])
  end

  def room_params_without_photos
    params.require(:room).permit(:home_type, :room_type, :max_occupancy, :bedrooms, :bathrooms, :has_bathtub,
                                 :has_kitchen, :has_air_con, :has_wifi, :summary, :address, :price, :checkin_start_at, :checkin_end_at, :checkout_time)
  end
end
