require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo = Todo.create(name: "Shopping", description: "Create Shopping List")
    @admin_user = User.create(name: "william", email: "william@yahoo.ca",
                              password: "password", admin: true)
  end

  test "should get index" do
    get todos_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@admin_user)
    get new_todo_url
    assert_response :success
  end

  test "should create todo" do
    sign_in_as(@admin_user)
    assert_difference('Todo.count', 1) do
      post todos_url, params: { todo: { name: "Travelling", 
                                        description: "Book train tickets"  } }
    end
    assert_redirected_to todo_url(Todo.last)
  end

  test "Should not create TODO if not Admin" do
    assert_no_difference('Todo.count') do
      post todos_url, params: { category: { name: "Travel"} }
    end
  end

  test "should show todo" do
    get todo_url(@todo)
    assert_response :success
  end

  # test "should get edit" do
  #   get edit_todo_url(@todo)
  #   assert_response :success
  # end

  # test "should update todo" do
  #   patch todo_url(@todo), params: { todo: {  } }
  #   assert_redirected_to todo_url(@todo)
  # end

  # test "should destroy todo" do
  #   assert_difference('Todo.count', -1) do
  #     delete todo_url(@todo)
  #   end

  #   assert_redirected_to todos_url
  # end
end
