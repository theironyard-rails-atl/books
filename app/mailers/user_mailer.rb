class UserMailer < ActionMailer::Base
  default from: 'no-reply@book-project.example.com'

  def ping_user user
    @user = user
    @book = Book.first
    mail(to: user.email, subject: 'Ping!')
  end
end
