class GuestReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_booking, only: [:create]
  before_action :find_guestreview, only: [:destroy]
      
  def create
    @guestreviews = @booking.guestreviews.new(guestreview_params)

    if @guestreviews.save
      redirect_to booking_path(@booking), notice: '已評論成功'
    else
      redirect_to booking_path(@booking), alert: '請填寫評論'
    end
  end
      
  def destroy
    @guestreviews.destroy
  end
    
  private
    def find_booking
      @booking = current_user.bookings.find(params[:booking_id])
    end
       
    def find_guestreview
      @guestreview = current_user.guestreviews.find(params[:id])
    end
      
    def guestreview_params
      params.require(:guestreviews).permit(:comment).merge(user: current_user)
    end
  end
end
