class HomeController < ApplicationController
  def index
    @blogs = BlogPost.order(created_at: :desc).limit(10)
    @staff_pick = BlogPost.all.sample(5)
  end
end
