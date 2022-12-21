class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def should_compelete_user_info
    if current_user.name.blank? && current_user.phone_num.blank?
      redirect_to edit_user_registration_path, alert: '需填寫完整資料'
    end
  end
end
