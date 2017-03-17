require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  test "saves with valid attributes" do
    post = Post.new(
      title:  "some title",
      author: "some name",
      body:   "some text"
    )
    assert post.save
  end
  
  test "validates title presence" do
    comment = Comment.new(
      title:  nil,
      author: "some author",
      body:   "some text"
    )
    assert_not comment.valid?
  end
  
  test "validates author presence" do
    comment = Comment.new(
      title:  "some title",
      author: nil,
      body:   "some text"
    )
    assert_not comment.valid?
  end
  
  test "validates body presence" do
    comment = Comment.new(
      title:  "some title",
      author: "some name",
      body:   nil
    )
    assert_not comment.valid?
  end 
  
end
