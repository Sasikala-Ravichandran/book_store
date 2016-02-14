class ApplicationMailer < ActionMailer::Base
  default from: "Sales Order<sales@example.com>"
  layout 'mailer'
end
