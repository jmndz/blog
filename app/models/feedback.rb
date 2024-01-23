class Feedback < ApplicationRecord
  belongs_to :user
  belongs_to :blog_post

  validates_presence_of :body
end
