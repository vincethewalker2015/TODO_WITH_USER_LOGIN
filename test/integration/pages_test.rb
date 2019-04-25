require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest
  
   test "Should get home page" do
     get home_url
     assert_response :success
   end
   
   test "Should get rool URL" do
     get root_url
     assert_response :success
   end
   
end
