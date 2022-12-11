class RoomReviewsController < ApplicationController

    def index
      @roomreviews = RoomrReview.all
    end
  
    def new
      @roomreview = RoomRevie.new
    end
  
    def create
      
      @roomreview = RoomeReview.new(roomreview_clean_parmas)
  
      if @roomreview.save
        flash[:notice] = "評論已新增"
        redirect_to '/roomreviews'
      else
        render :new
      
      end
  
    end

    def show
      @roomreview = RoomrReview.find_by(id: params[:id])
    end
  
    def edit
        @roomreview = RoomrReview.find_by(id: params[:id])
    end

    def update
        @roomreview = RoomrReview.find_by(id: params[:id])

        if @roomreview.update(roomreview_clean_parmas)
            flash[:notice] = "評論已更新"
            redirect_to '/roomreviews'
        else
          render :edit
        end
    end
  
    def destroy
      @roomreview = RoomrReview.find_by(id: params[:id])
      @roomreview.destroy

      flash[:notice] = "評論已刪除"
      redirect_to '/roomreviews'
    end
  
    private
    def roomreview_clean_parmas
      params.require(:room_review).permit(:reservation_id, :accuracy_rating, :check_in_rating, :cleanliness_rating, :communiaction_rationg, :location_ration, :value_rating, :comment)
    end
  end