class Comment < ActiveRecord::Base
  # Validates what MUST be included to make a comment.
  validates :body,   :presence => true
  validates :author, :presence => true
  
  # Set up association to belong to Post ActiveRecord.
  belongs_to :post
end
