class RecommendationMailer < ActionMailer::Base

  def send_recommendation recommendation
    @sender = recommendation.sender
    @recipient = recommendation.recipient
    @book = recommendation.book
    mail(from: @sender.email, to: @recipient.email, subject: "#{@book.title} recommendation") do |format|
      format.text
      format.html
    end
  end

end
