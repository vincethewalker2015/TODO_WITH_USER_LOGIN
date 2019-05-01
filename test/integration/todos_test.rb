require 'test_helper'

class TodosTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.create!(name: "vinnie", email: "contact@vincethewalker.com", password_digest: "password")
    # the create! saves the object straight to the d:base
    @todo = Todo.create(name: "Book Tickets", description: "Book domestic flight tickets", user: @user)
    # Todo.create still needs to be manually associated with the user using - user: @user
    @todo2 = @user.todos.build(name: "Fuel", description: "Fill Car up with Fuel")
    @todo2.save
    # @user.todos.build automatically associates the Todo with the User but still need to manually save using @todo2.save
  end
  
   test "Should Get Todos URL" do
     get todos_url
     assert_response :success
   end
   
   
   
end
