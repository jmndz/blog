require 'rails_helper'

RSpec.describe "Blogs", type: :request do
  let(:user) { User.create(first_name: "John", last_name: "Doe", email: "johndoe@mailinator.com", password: "Asd@123!", password_confirmation: "Asd@123!") }
  let(:other_user) { User.create(first_name: "Other", last_name: "Doe", email: "other@mailinator.com", password: "Asd@123!", password_confirmation: "Asd@123!") }
  let(:blog_post) { BlogPost.create(title: 'Test Post', content: 'This is a test post', user: user) }

  describe "#new" do
    it "returns a successful response" do
      sign_in user
      get new_blog_path
      expect(response).to be_successful
    end
  end

  describe "#create" do
    it "creates a new blog post" do
      sign_in user
      post blogs_path, params: { blog_post: { title: 'New Post', content: 'This is a new post', user: user } }
      expect(BlogPost.last.title).to eq('New Post')
    end
  end

  describe "#show" do
    it "redirects to the root path if the blog does not exist" do
      get blog_path(id: 999)
      expect(response).to redirect_to(root_path)
      expect(flash[:error]).to eq("Blog does not exist")
    end

    it "returns a successful response if the blog exists" do
      get blog_path(id: blog_post.id)
      expect(response).to be_successful
    end
  end

  describe "#edit" do
    it "redirects to the blog path if the user is not the author" do
      sign_in other_user
      get edit_blog_path(id: blog_post.id)
      expect(response).to redirect_to(blog_path(blog_post))
      expect(flash[:error]).to eq("You are not authorized to access this page")
    end

    it "returns a successful response if the user is the author" do
      sign_in user
      get edit_blog_path(id: blog_post.id)
      expect(response).to be_successful
    end
  end

  describe "#update" do
    it "redirects to the blog path if the user is not the author" do
      sign_in other_user
      patch blog_path(id: blog_post.id, blog_post: { title: 'Updated Post' })
      expect(response).to redirect_to(blog_path(blog_post))
      expect(flash[:error]).to eq("You are not authorized to access this page")
    end

    it "updates the blog post if the user is the author" do
      sign_in user
      patch blog_path(id: blog_post.id, blog_post: { title: 'Updated Post' })
      expect(blog_post.reload.title).to eq('Updated Post')
    end
  end

  describe "#destroy" do
    it "redirects to the blog path if the user is not the author" do
      sign_in other_user
      delete blog_path(id: blog_post.id)
      expect(response).to redirect_to(blog_path(blog_post))
      expect(flash[:error]).to eq("You are not authorized to access this page")
    end

    it "deletes the blog post if the user is the author" do
      sign_in user
      delete blog_path(id: blog_post.id)
      expect(BlogPost.exists?(blog_post.id)).to be_falsey
    end
  end
end
