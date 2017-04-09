class Post < ActiveRecord::Base
  # Validates what MUST be included to make a post.
  validates :title,  :presence => true 
  validates :body,   :presence => true
  validates :author, :presence => true
  
  # Set up association to contain many Comment ActiveRecord instances.
  belongs_to :course
  has_many  :comments
end
