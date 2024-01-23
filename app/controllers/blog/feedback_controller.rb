class Blog::FeedbackController < ApplicationController
  before_action :authenticate_user!
  def create
    @blog = BlogPost.find_by_id(params[:blog_id])
    @feedback = Feedback.new(feedback_params)

    if @feedback.save
      FeedbackMailer.feedback_email(email: @blog.user.email, title: @blog.title, body: @feedback.body).deliver_later
    end

    redirect_back fallback_location: blog_path(@blog), flash: { success: "Feedback sent successfully" }
  end

  private

  def feedback_params
    params.require(:feedback).permit(:body).merge(user_id: current_user.id, blog_post_id: @blog.id)
  end
end
