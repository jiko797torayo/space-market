class ApplicationMailer < ActionMailer::Base
  default from: '36team-A Space Market',
          bcc: ENV['MAILER_USER_NAME']
  layout 'mailer'
end
