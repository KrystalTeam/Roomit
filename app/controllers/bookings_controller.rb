# frozen_string_literal: true

class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[confirm cancel]
  skip_before_action :authenticate_user!, only: %i[confirm cancel]
  before_action :should_compelete_user_info, only: [:new]

  def create
    @room = Room.find(params[:booking][:room_id])
    @booking = Booking.new(booking_params)

    if @booking.save
      @booking.unpaid!
      # after payment success => get the response from the confirm api
      @api_obj = LinePayApi.new("/v3/payments/request")

      req_nonce = @api_obj.nonce
      req_body = @api_obj.req_body(@room, @booking)
      req_signature = @api_obj.get_signature(req_nonce, req_body)
      req_header = @api_obj.header(req_nonce, req_signature)

      # get the response from the request api => get the paymentUrl
      req_response = @api_obj.get_response(req_header, req_body)
      webConfirmUrl = JSON.parse(req_response.body)["info"]["paymentUrl"]["web"]

      # redirect to the paymentUrl => user scans and pays
      redirect_to webConfirmUrl
      # if success => redirect to the confirmUrl
      # if not => redirect to the cancelUrl
    else
      redirect_to room_path(@room), alert: "訂房失敗"
    end
  end

  def confirm
    @booking = Booking.find_by!(serial: params[:id])
    if @booking.paid!
      @api_obj = LinePayApi.new("/v3/payments/#{params[:transactionId]}/confirm")
      confirm_nonce = @api_obj.nonce
      confirm_body = @api_obj.confirm_body(@booking)
      confirm_signature = @api_obj.get_signature(confirm_nonce, confirm_body)
      @api_obj.get_response(@api_obj.header(confirm_nonce, confirm_signature), confirm_body)

      redirect_to root_path, notice: "訂單付款成功"
    end
  end

  def index
    @first_booking = current_user.bookings.order(start_at: :ASC)[0]
  end

  def new
    @booking = current_user.bookings.new
    @room = Room.find(params[:room_id])
    @owner_name = User.find(@room.user_id).name ? User.find(@room.user_id).name : "房東"
    @room_intro = @room.summary.size >= 15 ? @room.summary[0..15] : @room.summary
    @nights = (params[:end_at].to_date - params[:start_at].to_date).to_i
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def cancel
    @booking = Booking.find_by!(serial: params[:id])
    @booking.cancelled!
    redirect_to root_path, notice: "訂單付款失敗！"
  end

  private

  def find_room
    @room = Room.find(params[:room_id])
  end

  def verify_owner
  end

  def booking_params
    params.require(:booking).permit(:user_id, :room_id, :start_at, :end_at, :price_per_night, :serial, :headcount)
  end
end
