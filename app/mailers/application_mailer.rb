class ApplicationMailer < ActionMailer::Base
  default from: 'partyrockeverydayimshufflin@gmail.com'
  def sendmail_confirm(user)    
    mail to: user.email, subject: "[HOME PAGE]お問い合わせがありました"
  end
end
