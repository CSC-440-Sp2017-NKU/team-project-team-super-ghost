class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates :role, :presence => true

  has_secure_password

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :post_votes, :dependent => :destroy
  has_many :comment_votes, :dependent => :destroy
  has_and_belongs_to_many :courses
  before_destroy { courses.clear }
end
