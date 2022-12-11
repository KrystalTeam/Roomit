class RoomReviewsController < ApplicationController
    def index
      @roomreviews = Roomreview.all
    end
  
    def new
      @roomreview = RoomReviews.new
    end
  
    def create
      
  
      @roomreview = Roomeeview.new(roomreview_clean_parmas)
  
      if @roomreview.save
        flash[:notice] = "評論已新增"
        redirect_to '/room_reviews'
      
      end
  
    end
  
    def edit
    end
  
    def show
    end
  
    private
    def roomreview_clean_parmas
      params.require(:room_review).permit(:reservation_id, :accuracy_rating, :check_in_rating, :cleanliness_rating, :communiaction_rationg, :location_ration, :value_rating, :comment)
    end
  end