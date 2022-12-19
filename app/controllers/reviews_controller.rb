class ReviewsController < ApplicationController
    def index
      @reviews = Review.all
    end
    
    def new
      @reviews = Review.new
    end

    def create
      @reviews = current_user.reviews.new(review_params)
      if @reviews.save
        redirect_to new_path, notice: '已完成評價'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @review.update(reviews_params)
        redirect_to root_path, notice: '已完成更改'
      else
        flash alert: '請重新編輯'
        render :edit
      end
    end

    def destroy
      @review.destroy
      redirect_to root_path, noice: '評價已刪除'
    end

    # def show
    #   @review = Review.new
    #   @review = @review.comments.order(id: :desc)
    # end

  private

  def find_review
    @review = Review.find(params[:id])
  end
    
# def find_guestreview
#   @guestreview = current_user.guestreviews.find(params[:id])
# end
    
  def review_params
    params.require(:review).permit(:comment, :user_id, :room_id, :rating, :deleted_at, :state)
  end
end
