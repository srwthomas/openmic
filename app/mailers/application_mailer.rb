class ApplicationMailer < ActionMailer::Base
  default from: ENV["EMAIL_UN"]
  layout "mailer"
end
