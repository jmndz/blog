require 'rails_helper'

RSpec.describe "Blog::Feedbacks", type: :request do
  describe "#create" do
    let(:user) { User.create(first_name: "John", last_name: "Doe", email: "johndoe@mailinator.com", password: "Asd@123!", password_confirmation: "Asd@123!") }
    let(:blog) { BlogPost.create(title: "My Blog Post", content: "This is my blog post content", user: user) }

    it "redirects back to the blog post with a success message" do
      sign_in user
      post blog_feedback_index_path, params: { blog_id: blog.id, feedback: { body: 'Great post!' } }
      expect(response).to redirect_to(blog_path(blog))
      expect(flash[:success]).to eq("Feedback sent successfully")
    end

    it "sends a feedback email to author" do
      sign_in user
      expect {
        post blog_feedback_index_path, params: { blog_id: blog.id, feedback: { body: 'Great post!' } }
      }.to change {
        ActiveJob::Base.queue_adapter.enqueued_jobs.count
      }.by 1
    end
  end
end
