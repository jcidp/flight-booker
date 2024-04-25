class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name("from@example.com", "Your BFF")
  layout "mailer"
end
