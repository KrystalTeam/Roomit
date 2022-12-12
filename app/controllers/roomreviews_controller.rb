class RoomreviewsController < ApplicationController
      before_action :find_roomreview, only: [:show, :edit, :update, :destroy]

      def index
        @roomreviews = RoomReview.all
      end
    
      def new
        @roomreview = RoomReview.new
      end
    
      def create
        
        @roomreview = RoomeReview.new(roomreview_clean_parmas)
    
        if @roomreview.save
          redirect_to '/roomreviews', notice: "評論已新增"
        else
          render :new
        
        end
    
      end
  
      def show
        
      end
    
      def edit
        
      end
  
      def update
        
  
          if @roomreview.update(roomreview_clean_parmas)
              redirect_to '/roomreviews', notice: "評論已更新"
          else
            render :edit
          end
      end
    
      def destroy
        @roomreview.destroy
  
        redirect_to '/roomreviews', notice: "評論已刪除"
      end
    
      private
      def roomreview_clean_parmas
        params.require(:room_review).permit(:reservation_id, :accuracy_rating, :check_in_rating, :cleanliness_rating, :communiaction_rationg, :location_ration, :value_rating, :comment)
      end  

      def find_roomreview
        @roomreview = RoomReview.find_by(id: params[:id])
      end
end
