# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
<<<<<<< HEAD
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
=======
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
>>>>>>> f729c52dc0507b3e96b8b63ed75b2b38a2a353e1
end
