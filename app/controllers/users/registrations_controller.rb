# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def update
      @user = User.find(params[:user][:id])

      if @user.update(user_params)
        redirect_to edit_user_registration_path, notice: '更新成功'
      else
        render :edit, alert: @user.errors.full_messages.join("\n")
      end
    end

    def create
      super
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :description, :phone_num, :current_password, :password, :name,
                                   :avatar, :id)
    end
  end
end
