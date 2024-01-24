require "rails_helper"

RSpec.describe FeedbackMailer, type: :mailer do
  describe "feedback_email" do
    let(:user) { User.create(first_name: "John", last_name: "Doe", email: "johndoe@mailinator.com", password: "Asd@123!", password_confirmation: "Asd@123!") }
    let(:blog) { BlogPost.create(title: "My Blog Post", content: "This is my blog post content", user: user) }
    let(:feedback) { Feedback.create(body: "This is my feedback", user: user, blog_post: blog) }
    let(:mail) { FeedbackMailer.feedback_email(email: user.email, title: blog.title, body: feedback.body) }

    it "sends an email" do
      expect { mail.deliver_now }.to change { ActionMailer::Base.deliveries.count }.by(1)
    end

    it "renders the subject" do
      expect(mail.subject).to eq("Thoughts on Your Blog Post – User Feedback Inside!")
    end

    it "renders the receiver email" do
      expect(mail.to).to eq([user.email])
    end

    it "renders the sender email" do
      expect(mail.from).to eq(["rorblogdev@gmail.com"])
    end

    it "assigns @body" do
      expect(mail.body.encoded).to match(feedback.body)
    end

    it "assigns @title" do
      expect(mail.body.encoded).to include(blog.title)
    end
  end
end
