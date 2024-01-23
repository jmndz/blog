require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  subject { described_class.new(title: "My Blog Post", content: "This is my blog post content") }

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_rich_text(:content) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end
end
