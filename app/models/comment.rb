class Comment < ActiveRecord::Base
  validates :body, :presence => true
  validates :post_id, :presence => true
  validates :user_id, :presence => true

  belongs_to :user
  belongs_to :post
  has_many :comment_votes, :dependent => :destroy
end
