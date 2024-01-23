require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(
    first_name: "John", 
    last_name: "Doe", 
    email: "johndoe@mailinator.com", 
    password: "Asd@123!", 
    password_confirmation: "Asd@123!"
  )}

  describe "associations" do
    it { should have_many(:blog_posts).dependent(:destroy) }
    it { should have_many(:feedbacks).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe "full_name" do
    it "returns the full name of the user" do
      expect(subject.full_name).to eq("John Doe")
    end
  end
end
