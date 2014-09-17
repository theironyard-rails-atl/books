class UserMailer < ActionMailer::Base
  def ping_user user
    # Get data
    mail(to: user.email, subject: 'Ping!')
  end
end
