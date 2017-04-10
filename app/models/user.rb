class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true

  has_secure_password

  has_many :posts
  has_many :comments
  has_and_belongs_to_many :courses
end
