# frozen_string_literal: true

class SearchController < ApplicationController
  def index
    @q = Room.ransack(params[:q])

    return unless params[:q].present?

    searched_dates = ((params[:q][:bookings_start_at]).to_date..(params[:q][:bookings_end_at]).to_date).to_a
    @rooms = @q.result(distinct: true).with_attached_photos.includes([:reviews]).reject do |room|
      disable_dates(room).intersect?(searched_dates)
    end
  end
end
