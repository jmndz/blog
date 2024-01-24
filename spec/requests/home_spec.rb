require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "#index" do
    let(:user) { User.create(first_name: "John", last_name: "Doe", email: "johndoe@mailinator.com", password: "Asd@123!", password_confirmation: "Asd@123!") }

    it "returns http success" do
      get root_path
      expect(response).to have_http_status(:success)
    end

    it "assigns @blogs" do
      blog1 = BlogPost.create(title: "First Blog", content: "Content of the first blog", user: user)
      blog2 = BlogPost.create(title: "Second Blog", content: "Content of the second blog", user: user)
      get root_path
      expect(assigns(:blogs)).to eq([blog2, blog1])
    end

    it "assigns @staff_pick" do
      staff_pick1 = BlogPost.create(title: "Staff Pick 1", content: "Content of staff pick 1", user: user)
      staff_pick2 = BlogPost.create(title: "Staff Pick 2", content: "Content of staff pick 2", user: user)
      staff_pick3 = BlogPost.create(title: "Staff Pick 3", content: "Content of staff pick 3", user: user)
      staff_pick4 = BlogPost.create(title: "Staff Pick 4", content: "Content of staff pick 4", user: user)
      staff_pick5 = BlogPost.create(title: "Staff Pick 5", content: "Content of staff pick 5", user: user)
      get root_path
      expect(assigns(:staff_pick)).to match_array([staff_pick5, staff_pick4, staff_pick3, staff_pick2, staff_pick1])
    end
  end
end
