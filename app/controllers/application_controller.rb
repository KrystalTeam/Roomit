class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def should_compelete_user_info
    unless current_user.name  && current_user.phone_num && current_user.name != '' && current_user.phone_num != ''
        redirect_to edit_user_registration_path, alert: '需填寫完整資料'
    end
  end
end
