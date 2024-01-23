class BlogsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_blog, except: [:new, :create]

  def new
    @blog = BlogPost.new
  end

  def create
    @blog = BlogPost.new(blog_params.merge(user: current_user))

    if @blog.save
      redirect_to blog_path(@blog), flash: { success: "Blog published successfully" }
    else
      redirect_back fallback_location: new_blog_path
    end
  end

  def show
    unless @blog.present?
      redirect_to root_path, flash: { error: "Blog does not exist" }
    end
  end

  def edit
    if @blog.user != current_user 
      redirect_to blog_path(@blog), flash: { error: "You are not authorized to access this page" }
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to blog_path(@blog), flash: { success: "Blog updated successfully" }
    else
      redirect_to edit_blog_path(@blog), flash: { error: @blog.errors.full_messages.first }
    end
  end

  def destroy
    if @blog.destroy
      redirect_to root_path, flash: { success: "Blog deleted successfully" }
    else
      redirect_to edit_blog_path(@blog), flash: { error: @blog.errors.full_messages.first }
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
