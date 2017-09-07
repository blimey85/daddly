class ApplicationMailer < ActionMailer::Base
  default from: 'notifier@daddly.io'
  layout 'mailer'
end
