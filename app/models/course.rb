class Course < ActiveRecord::Base
  validates :title, :presence => true

  has_many :posts
  has_and_belongs_to_many :users
end
