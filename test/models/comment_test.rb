require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  
  test "saves with valid attributes" do
    comment = Comment.new(
      author: "some name",
      body:   "some text"
    )
    assert comment.save
  end
  
  test "validates author presence" do
    comment = Comment.new(
      author: nil,
      body:   "some text"
    )
    assert_not comment.valid?
  end
  
  test "validates body presence" do
    comment = Comment.new(
      author: "some name",
      body:   nil
    )
    assert_not comment.valid?
  end 
  
end
