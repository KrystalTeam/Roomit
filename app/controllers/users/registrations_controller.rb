# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

    def update
      @user = User.find(params[:user][:id])

        if @user.update(user_params)
          redirect_to edit_user_registration_path, notice: '更新成功'
        else
          render :edit, alert: @user.errors.full_messages.join("\n")
        end
    end

    def create
      build_resource(sign_up_params)
  
      resource.save
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          redirect_to root_path
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        clean_up_passwords resource
        set_minimum_password_length
        respond_with resource
      end
    end

    private
    def user_params
      params.require(:user).permit(:email, :password, :description, :phone_num, :current_password, :password, :name, :avatar, :id)
    end
end
