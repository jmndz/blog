class FeedbackMailer < ApplicationMailer
  def feedback_email(email:, title:, body:)
    @title = title
    @body = body

    mail(to: email, subject: "Thoughts on Your Blog Post – User Feedback Inside!")
  end
end
