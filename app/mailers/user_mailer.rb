class UserMailer < ActionMailer::Base
  default from: 'no-reply@book-project.example.com'

  def ping_user user
    @user = user
    @book = Book.first

    # Mailers have attachments
    #   Not visible in body, just an attachment
    #attachments['cute-attachment.gif'] = File.read(Rails.root.join 'public', 'cute.gif')
    #   For this to be visible inline, do -
    attachments.inline['cute.gif'] = File.read(Rails.root.join 'public', 'cute.gif')

    mail(to: user.email, subject: 'Ping!')
  end
end
