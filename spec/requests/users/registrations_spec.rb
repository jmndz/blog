require 'rails_helper'

RSpec.describe "Users::RegistrationsController", type: :request do
  describe " #create" do
    it "creates a new user" do
      post "/users", params: { user: { first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password' } }
      expect(User.last.email).to eq('john@example.com')
    end

    it "returns a success response if the user is valid" do
      post "/users", params: { user: { first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password' } }
      expect(response).to be_successful
      expect(response.body).to include("success\":true")
    end

    it "returns a failure response if the user is invalid" do
      post "/users", params: { user: { first_name: 'John', last_name: 'Doe', email: 'john@example.com', password: 'password', password_confirmation: 'wrong_password' } }
      expect(response).to be_successful
      expect(response.body).to include("success\":false")
    end
  end
end