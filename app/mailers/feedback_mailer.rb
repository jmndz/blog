class FeedbackMailer < ApplicationMailer
  def feedback_email(email:, title:, body:)
    @body = body

    mail(to: email, subject: "Feedback - '#{title}'")
  end
end
