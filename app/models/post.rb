class Post < ActiveRecord::Base
  validates :title, :presence => true
  validates :body, :presence => true
  validates :user_id, :presence => true
  validates :course_id, :presence => true

  belongs_to :course
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :post_votes, :dependent => :destroy
end
