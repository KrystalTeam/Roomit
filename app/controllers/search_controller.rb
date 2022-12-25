class SearchController < ApplicationController
  def index
    @q = Room.ransack(params[:q])

    if params[:q].present?
      searched_dates = ((params[:q][:bookings_start_at]).to_date..(params[:q][:bookings_end_at]).to_date).to_a
      @rooms = @q.result(distinct: true).includes(:bookings).reject do |room|
        disable_dates(room).flatten.intersect?(searched_dates)
      end
    end
  end
  
end
