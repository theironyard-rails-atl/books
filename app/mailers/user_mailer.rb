class UserMailer < ActionMailer::Base
  default from: "Ja-Querie@weareamazing.com"

  def friend_email friend
    @friend = friend
    mail(to: friend.email, subject: "You are my friend!")
  end

  def unfriend_email unfriend
    @unfriend = unfriend
    mail(to: unfriend.email, subject: "You are my unfriend!")
  end
end
