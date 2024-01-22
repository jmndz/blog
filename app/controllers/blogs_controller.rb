class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_blog, only: [:show]

  def new
    @blog = BlogPost.new
  end

  def create
    @blog = BlogPost.new(blog_params.merge(user: current_user))

    if @blog.save
      redirect_to blog_path(@blog)
    else
      redirect_back fallback_location: new_blog_path
    end
  end

  def show
    unless @blog.present?
      redirect_to root_path
    end
  end

  private

  def set_blog
    @blog = BlogPost.find_by_id(params[:id])
  end

  def blog_params
    params.require(:blog_post).permit(:title, :content)
  end
end
