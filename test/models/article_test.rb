require 'test_helper'

class ArticleTest < ActiveSupport::TestCase


  def setup
    @article = Article.new(title: "title1", img_name: "img1", contents: "texttext",color:"",img_style:"",author:"1")

  end

  test "comments should be destroyed" do
    @article.save
    @article.comments.create!(body: "Lorem ipsum")
    assert_difference 'Comment.count', -1 do
      @article.destroy
    end
  end

test "article should be destroyed" do
     
     @article.save
     assert_difference 'Article.count', -1 do
       @article.destroy
     end
   end

end
