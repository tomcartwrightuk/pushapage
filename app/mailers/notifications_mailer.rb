class NotificationsMailer < ActionMailer::Base

  default :from => "tecartwright@gmail.com"
  default :to => "tecartwright@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.subject}")
  end

end
