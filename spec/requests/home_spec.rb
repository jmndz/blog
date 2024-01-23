require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "assigns @blogs" do
      blog_post = create(:blog_post)
      get root_path
      expect(assigns(:blogs)).to eq([blog_post])
    end

    it "assigns @staff_pick" do
      blog_post = create(:blog_post)
      get root_path
      expect(assigns(:staff_pick)).to eq([blog_post])
    end
  end
end
