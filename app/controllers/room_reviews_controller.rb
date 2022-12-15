class RoomReviewsController < ApplicationController
  before_action :find_roomreview, only: [:show, :edit, :update, :destroy]

  def index
    @roomreviews = RoomReview.all
  end

  def new
    @roomreview = RoomReview.new
  end

  def create
    @roomreview = RoomeReview.new(roomreview_parmas)

    if @roomreview.save
      redirect_to '/room_reviews', notice: "評論已新增"
    else
      render :new
    end
  end

  def show   
  end

  def edit
  end

  def update
    if @roomreview.update(roomreview_parmas)
      redirect_to '/room_reviews', notice: "評論已更新"
    else
      render :edit
    end
  end

  def destroy
    @roomreview.destroy

    redirect_to '/roomreviews', notice: "評論已刪除"
  end

  private
  def roomreview_parmas
    params.require(:room_review).permit(:booking_id, :accuracy_rating, :check_in_rating, :cleanliness_rating, :communication_rating, :location_rating, :value_rating, :comment)
  end  

  def find_roomreview
    @roomreview = RoomReview.find(params[:id])
  end
end
