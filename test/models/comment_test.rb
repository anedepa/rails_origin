require 'test_helper'

class CommentTest < ActiveSupport::TestCase


  def setup
    
    @user = users(:kabuto)
    @article = articles(:one)
    @article3 = articles(:three)
    @comment = comments(:one)
    
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "article id should be present" do
    @comment.article_id = nil
    assert_not @comment.valid?
  end

  test "body should be present" do
    @comment.body = "   "
    assert_not @comment.valid?
  end

  test "body should be at most 30 characters" do
    @comment.body = "a" * 31
    assert_not @comment.valid?
  end

  

end
