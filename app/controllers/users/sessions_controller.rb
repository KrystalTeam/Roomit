# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def new
      super

      redirect_to root_path if current_user
    end
  end
end
