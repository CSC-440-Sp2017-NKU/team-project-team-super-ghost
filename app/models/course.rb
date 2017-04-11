class Course < ActiveRecord::Base
  validates :title, :presence => true, :uniqueness => true

  has_many :posts, :dependent => :destroy
  has_and_belongs_to_many :users
  before_destroy { users.clear }
end
