# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  
  def new
    super
    
    if current_user
      redirect_to root_path
    end
  end

end
