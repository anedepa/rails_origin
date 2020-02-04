require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:kabuto)
  end

  test "profile display" do
    log_in_as(@user)
    get user_path(@user)
    assert_response :success
    assert_template 'users/show'
    assert_select 'h1', text: @user.name
    assert_select "a[href=?]", user_path
    assert_select "a[href=?]", edit_user_path
    assert_match @user.articles.count.to_s, response.body
    
  end
end
