require 'test_helper'

class ArticleTest < ActiveSupport::TestCase


  def setup
    
    @user = users(:kabuto)
    @article = @user.articles.build(title: "title1", contents: "texttext",color:"ccc",img_style:"iii",picture:"img1.png")
    
  end

   test "should be valid" do
    assert @article.valid?
  end

  test "user id should be present" do
    @article.user_id = nil
    assert_not @article.valid?
  end

  test "content should be present" do
    @article.contents = "   "
    assert_not @article.valid?
  end

  test "content should be at most 100 characters" do
    @article.contents = "a" * 101
    assert_not @article.valid?
  end

end
