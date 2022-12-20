class ReviewsController < ApplicationController
    
  def index
      @review = Review.all
    end
    
    def new
      @review = Review.new
    end

    def create
      @review = Review.new(review_params)

      if @review.save
        redirect_to review_path, notice: '已完成評價'
      else
        flash[:alert] = '未完成評價'
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

  private

  def find_review
    @reviews = Review.find(params[:id])
  end
     
  def review_params
    params.require(:review).permit(:comment, :user_id, :room_id, :rating, :deleted_at, :state)
  end
end
