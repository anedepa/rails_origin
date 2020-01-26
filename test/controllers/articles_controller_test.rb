require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest


  test"index get" do
    get root_url
    assert_response :success
    assert_select "title", "試用アプリ"
    #assert_select "h1", "投稿"
  end

  test"new get" do
    get new_article_url
    assert_response :success
  end



end
