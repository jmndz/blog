class BlogPost < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates_presence_of :title, :content
end
