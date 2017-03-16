class Post < ActiveRecord::Base
    validates :title,  :presence => true # Post MUST have a title to be valid.
    # belongs_to   :author
    has_many  :comments
end
