# frozen_string_literal: true

class BookingsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[index confirm cancel ebpaid notify_response]
  skip_before_action :authenticate_user!, only: %i[confirm cancel ]
  before_action :should_compelete_user_info, only: [:new]
  before_action :cancel_unpaid_bookings, :update_past_bookings
  protect_from_forgery with: :null_session, only: [:ebpaid]

  def create
    @room = Room.find(params[:booking][:room_id])
    @booking = Booking.new(booking_params)
    
    if @booking.save
      @booking.unpaid!
      # after payment success => get the response from the confirm api
      @api_obj = LinePayApi.new('/v3/payments/request')

      req_nonce = @api_obj.nonce
      req_body = @api_obj.req_body(@room, @booking)
      req_signature = @api_obj.get_signature(req_nonce, req_body)
      req_header = @api_obj.header(req_nonce, req_signature)

      # get the response from the request api => get the paymentUrl
      req_response = @api_obj.get_response(req_header, req_body)
      webConfirmUrl = JSON.parse(req_response.body)['info']['paymentUrl']['web']

      # redirect to the paymentUrl => user scans and pays
      redirect_to webConfirmUrl
      # if success => redirect to the confirmUrl
      # if not => redirect to the cancelUrl
    else
      redirect_to room_path(@room), alert: '訂房失敗'
    end
  end

  def confirm
    @booking = Booking.find_by!(serial: params[:id])
    return unless @booking.paid!

    @api_obj = LinePayApi.new("/v3/payments/#{params[:transactionId]}/confirm")
    confirm_nonce = @api_obj.nonce
    confirm_body = @api_obj.confirm_body(@booking)
    confirm_signature = @api_obj.get_signature(confirm_nonce, confirm_body)
    @api_obj.get_response(@api_obj.header(confirm_nonce, confirm_signature), confirm_body)

    redirect_to root_path, notice: '訂單付款成功'
  end

  def index
    @first_booking = current_user.bookings.where(state: 'paid').order(start_at: :ASC)[0]
    @past_bookings = current_user.bookings.where(state: 'past')
    @cancelled_bookings = current_user.bookings.where(state: 'cancelled')
  end

  def new  
    @booking = current_user.bookings.new
    @room = Room.find(params[:room_id])
    @owner_name = User.find(@room.user_id).name || '房東'
    @room_intro = @room.summary.size >= 15 ? @room.summary[0..15] : @room.summary
    @nights = (params[:end_at].to_date - params[:start_at].to_date).to_i
  end

  def ebpay
    @nights = (params[:end_at].to_date - params[:start_at].to_date).to_i
    @ebroom = Room.find(params[:room_id])
    @ebbooking = Booking.new({
      user_id: current_user.id,
      room_id: params[:room_id],
      price_per_night: @ebroom.price * @nights,
      start_at: params[:start_at],
      end_at: params[:end_at],
      headcount: params[:headcount]
    })

    if @ebbooking.save

      mpg = Newebpay::Mpg.new(@ebbooking, @ebroom, @nights)
      @form_info = mpg.form_info
      @info = mpg.info

      render json: { data: @ebbooking, form_info: @form_info, info: @info}
    end
  end

  def ebpaid
    # response = MpgResponse.new(params[:TradeInfo])
    # @order = Order.find_by(serial: response.order_no)
    # user = User.find(@booking.user_id)
    # sign_in(user)
    redirect_to root_path, notice: "訂單付款成功！"
  end
  

  def show
    @booking = Booking.find(params[:id])
    @review = Review.new
    @room_review = @booking.reviews.where(review_to: 'room')
    @nights = (@booking.end_at.to_date - @booking.start_at.to_date).to_i
  end

  def cancel
    @booking = Booking.find(params[:id])
    @booking.update_column(:state, 3)
    @booking.cancelled!
    if @booking.paid?
      redirect_to room_path, notice: '成功取消預訂'
    else
      redirect_to root_path, notice: '訂單付款失敗'
    end
  end

  def create_review
    @review = Review.create!(review_params)
    if @review.save
      redirect_to room_path(@review.booking.room.id), notice: '評論發佈成功!'
    else
      flash.alert = '評論發佈失敗！'
      render :show
    end
  end

  private

  def find_room
    @room = Room.find(params[:room_id])
  end

  def booking_params
    params.require(:booking).permit(:user_id, :room_id, :start_at, :end_at, :price_per_night, :serial, :headcount,:viewed)
  end

  def review_params
    params.require(:review).permit(:room_id ,:booking_id, :guest_rating, :accuracy_rating, :check_in_rating, :cleanliness_rating,
                                   :communication_rating, :location_rating, :value_rating, :comment, :review_to)
  end

  def cancel_unpaid_bookings
    Booking.unpaid.each do |booking|
      booking.update_column(:state, 3) if booking.created_at + 30 * 60 <= Time.current
    end
  end

  def update_past_bookings
    Booking.paid.each do |booking|
      booking.update_column(:state, 4) if booking.end_at <= Time.current
    end
  end
end

