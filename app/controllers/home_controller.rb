class HomeController < ApplicationController
  def index
    @blogs = BlogPost.order(created_at: :desc).limit(10)
  end
end
