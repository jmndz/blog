require 'rails_helper'

RSpec.describe "Users::SessionsController", type: :request do
  let(:user) { User.create(first_name: "John", last_name: "Doe", email: "johndoe@mailinator.com", password: "Asd@123!", password_confirmation: "Asd@123!") }

  describe "#create" do
    it "returns a success response if the user is authenticated" do
      post "/users/sign_in", params: { user: { email: user.email, password: user.password } }
      expect(response).to be_successful
      expect(response.body).to include("success\":true")
    end

    it "returns a failure response if the user is not authenticated" do
      post "/users/sign_in", params: { user: { email: user.email, password: 'wrong_password' } }
      expect(response).to be_successful
      expect(response.body).to include("success\":false")
    end
  end

  describe "#destroy" do
    it "logs out the user" do
      sign_in user
      delete "/users/sign_out"
      expect(response).to redirect_to(root_path)
    end
  end
end