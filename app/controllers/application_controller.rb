# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_global_search_variable
  
  def set_global_search_variable
    @query = Room.ransack(params[:q])
    if params[:q].present?
      if params[:q][:bookings_start_at].blank? && params[:q][:bookings_end_at].blank? && params[:q][:address_cont].blank? && params[:q][:max_occupancy_gteq].blank?
        redirect_to request.referer, notice: '請輸入搜尋條件'
      elsif params[:q][:bookings_start_at].present? ^ params[:q][:bookings_end_at].present?
        redirect_to request.referer, notice: '請輸入正確日期'
      elsif @query.result(distinct: true).with_attached_photos.includes([:reviews]).blank?
        redirect_to request.referer, notice: '此搜尋條件下沒有可訂房間，請重新搜尋'
      elsif params[:q].present? && params[:q][:bookings_start_at].present? && params[:q][:bookings_end_at].present?
        searched_dates = ((params[:q][:bookings_start_at]).to_date..(params[:q][:bookings_end_at]).to_date).to_a
        @rooms = @query.result(distinct: true).with_attached_photos.includes([:reviews]).reject do |room|
          disable_dates(room).intersect?(searched_dates)
        end
        render template: "rooms/index"
      else
        @rooms = @query.result(distinct: true).with_attached_photos.includes([:reviews])
        render template: "rooms/index"
      end
    end  
  end

  def should_compelete_user_info
    if current_user.name.blank? && current_user.phone_num.blank?
      redirect_to edit_user_registration_path, alert: '需填寫完整資料'
    end
  end

  def disable_dates(room)
    disabledates = []
    room.bookings.paid.map do |booking|
      (booking.start_at..booking.end_at.yesterday).map do |disabledate|
        disabledates << disabledate
      end
      disabledates.flatten
    end
  end

  def device
    agent = request.user_agent
    return 'tablet' if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return 'mobile' if agent =~ /Mobile/
    return 'desktop'
  end
end
