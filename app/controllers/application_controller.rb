# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_global_search_variable

  def set_global_search_variable
    @query = Room.ransack(params[:q])
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
end
