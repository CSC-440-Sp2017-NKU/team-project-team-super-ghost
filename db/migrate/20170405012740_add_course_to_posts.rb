class AddCourseToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :course, index: true, foreign_key: true
  end
end
