require 'rails_helper'

RSpec.describe Feedback, type: :model do
  subject { described_class.new(body: "This is my feedback") }

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:blog_post) }
  end

  describe "validations" do
    it { should validate_presence_of(:body) }
  end
end
