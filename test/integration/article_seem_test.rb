require 'test_helper'

class ArticleSeemTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

    def setup
      @article = articles(:one)
    end

    test "profile display" do
      get article_path(@article)
      assert_template 'articles/show'
      
      assert_select 'h1', text: @article.title
      
      assert_match @article.comments.count.to_s, response.body
      
	assert_select "img[src=?]",'/post_img/MyImg'
      @article.comments.paginate(page: 1).each do |comment|
        assert_match comment.body, response.body
      end
    end
  end
