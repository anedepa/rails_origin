require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest
   def setup
      @user = users(:kabuto)
   end

   test "layout links" do
      get root_path
      assert_template 'articles/index'
      assert_select "a[href=?]", root_path, count: 1
      assert_select "a[href=?]", new_user_url
      assert_select "a[href=?]", login_path
   
    end

    
    
    test "layout links when logged in" do
       log_in_as(@user)                                    
       get root_path
       assert_template 'articles/index'
       assert_select "a[href=?]", root_path, count: 1
       assert_select "a[href=?]", user_path(@user)
       assert_select "a[href=?]", logout_path
    end

end
