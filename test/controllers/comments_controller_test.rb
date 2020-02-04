require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:kabuto)
    @article = articles(:one)
    @another_article = articles(:two)
    @many_comented_article = articles(:three)
    @comment = comments(:one)
    #@comment = @article.comments.first
  end

  test "should exist delete link when logged in" do
    log_in_as(@user)
    get article_path(@article)
    assert_select "a", {count: 1, text: "[削除]"}
  end

  test "should  not exist delete link when not logged in" do  
    get article_path(@article)
    assert_select "a", {count: 0, text: "[削除]"}
    
  end

 

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Comment.count' do   
      delete article_comment_path(@article,@comment)
    end
    assert_redirected_to root_url
  end

  test "destroy when logged in" do
    log_in_as(@user) 
    assert_difference 'Comment.count', -1 do   
      delete article_comment_path(@article,@comment)
    end
    assert_redirected_to article_url(@article)
  end

  test "should redirect destroy when not authority" do
    log_in_as(@user) 
    assert_no_difference 'Comment.count' do   
      delete article_comment_path(@another_article,@comment)
    end
    assert_redirected_to root_url
  end



  test "create comment even if not logged in" do
    get article_path(@article)
    assert_select "li", {count: 0, text: "Lorem ipsum"}
    assert_difference 'Comment.count',+1 do
      post article_comments_path(@article), params: { comment: { body: "Lorem ipsum" } }
    end
    assert_redirected_to article_url(@article)
    get article_path(@article)
    assert_select "li", {count: 1, text: "Lorem ipsum"}
  end
 
  test"should exist pagination"do
    get article_path(@many_comented_article)
    assert_response :success
    assert_select 'div.pagination'
  end

end

