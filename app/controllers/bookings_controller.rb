class BookingsController < ApplicationController

  before_action :find_room, only: %i[create]
  skip_before_action :verify_authenticity_token, only: %i[confirm cancel]

  def create
    # render html: params
    @booking = Booking.new(
      user_id: params[:user_id],
      room_id: params[:room_id],
      start_at: params[:start_at].to_date,
      end_at: params[:end_at].to_date,
      price_per_night: params[:price].to_i
    )

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
    if @booking.paid!
      @api_obj = LinePayApi.new("/v3/payments/#{params[:transactionId]}/confirm")
      confirm_nonce = @api_obj.nonce
      confirm_body = @api_obj.confirm_body(@booking)
      confirm_signature = @api_obj.get_signature(confirm_nonce, confirm_body)
      @api_obj.get_response(@api_obj.header(confirm_nonce, confirm_signature), confirm_body)
    end
  end

  def cancel
    @booking = Booking.find_by!(serial: params[:id])
    @booking.cancelled!
  end

  private
  def find_room
    @room = Room.find(params[:room_id])
  end
end
