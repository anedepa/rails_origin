require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @article = articles(:one)
  end

 

  test"new get" do
    get new_article_url
    assert_response :success
    assert_select "h1", "新規投稿"
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
    assert_redirected_to login_url
  end
 
  test "should redirect create when not logged in" do
    assert_no_difference 'Article.count' do
      post articles_path, params: { article: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong article" do
    log_in_as(users(:kabuto))
    @article = articles(:two)
    
    assert_no_difference 'Article.count' do
      delete article_path(@article)
    end
    assert_redirected_to root_url
  end



end
