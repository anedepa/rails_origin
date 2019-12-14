require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
# class UserTest < ActiveSupport::TestCase

  def setup
    @article = Article.new(title: "title1", img_name: "img1", contents: "texttext")

  end

  test "coments should be destroyed" do
    @article.save
    @article.coments.create!(content: "Lorem ipsum")
    assert_difference 'Coment.count', -1 do
      @article.destroy
    end
  end
end
