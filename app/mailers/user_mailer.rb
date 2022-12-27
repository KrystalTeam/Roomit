# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'roomit@gmail.com'

  def welcome(user)
    @user = user
    @url = 'https://roomit.gg/'

    mail to: @user.email, subject: 'Welcome to Roomit'
  end
end
