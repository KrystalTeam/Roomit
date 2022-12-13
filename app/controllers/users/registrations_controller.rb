# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
    def create
      @user = User.new(user_params)

      if @user.save
        # UserMailer.welcome(@user).deliver_now
        redirect_to root_path
      else
        render :new
      end
    end

    def update
<<<<<<< HEAD
<<<<<<< HEAD
      @user = User.find(params[:user][:id])
=======
      @user = User.find_by(id: params[:user][:id])
>>>>>>> af6eae1 (add user edit name/email/number)
=======
      @user = User.find_by(id: params[:user][:id])
>>>>>>> 4712e99 (add user edit name/email/number)

        if @user.update(user_params)
          redirect_to edit_user_registration_path, notice: '更新成功'
        else
          render :edit, alert: @user.errors.full_messages.join("\n")
        end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :description, :phone_num, :current_password, :password, :name)
    end
end
