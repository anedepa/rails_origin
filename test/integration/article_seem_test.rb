require 'test_helper'

class ArticleSeemTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

    def setup
      @article = articles(:one)
    end

    test "profile display" do
      get article_path(@article)
      assert_template 'articles/show'
      # assert_select 'title', full_title(@user.name)
      assert_select 'h2', text: @article.title
      # assert_select 'h1>img.gravatar'
      assert_match @article.coments.count.to_s, response.body
      assert_select 'div.pagination'
      @article.coments.paginate(page: 1).each do |coment|
        assert_match coment.content, response.body
      end
    end
  end
