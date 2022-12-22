# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: ENV['MG_SMTP_USER_NAME']

  def welcome(user)
    @user = user
    @url = 'http://localhost:3000/users/sign_in'

    mail to: @user.email, subject: 'Welcome to Roomit'
  end
end
