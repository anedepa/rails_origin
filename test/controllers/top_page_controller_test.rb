require 'test_helper'

class TopPageControllerTest < ActionDispatch::IntegrationTest

   test"index pagenate" do
    get root_url
    assert_response :success
    assert_select "p", "5ずつ表示"
    assert_select 'div.pagination',count: 2
    post root_url, params: {per:"6"}
    assert_redirected_to root_url
    get root_url
    assert_select "p", "6ずつ表示"
    assert_select 'div.pagination',count: 0
   end
end
