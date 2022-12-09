# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    def create
      @user = User.new(user_params)

      if @user.save
        UserMailer.welcome(@user).deliver_now
        redirect_to root_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    def update
      @user = User.find_by(email: params[:user][:email])

      if @user.provider
        @user.skip_password_validation = true

        if @user.update(user_params)
          redirect_to edit_user_registration_path, notice: '更新成功'
        else
          render :edit, alert: @user.errors.full_messages.join("\n")
        end
      else
        if update_resource(@user, user_params)
          redirect_to edit_user_registration_path, notice: '更新成功'
        else
          render :edit, alert: @user.errors.full_messages.join("\n")
        end
      end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :description, :phone_num, :current_password, :password)
    end
end
