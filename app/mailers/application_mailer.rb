# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'roomit@gmail.com'
  layout 'mailer'
end
