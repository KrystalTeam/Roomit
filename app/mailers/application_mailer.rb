class ApplicationMailer < ActionMailer::Base
  default from: ENV['MG_SMTP_USER_NAME']
  layout 'mailer'
end
