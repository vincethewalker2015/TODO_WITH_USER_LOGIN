require 'test_helper'

class CreateTodoTest < ActionDispatch::IntegrationTest
  test "Get New Todo Form and Create the Todo" do
      get "/todos/new"
      assert_response :success
      assert_difference 'Todo.count', 1 do
        post todos_path, params: { todo: { name: "Travelling", description: "Travelling by car" } }
        assert_response :redirect
    end
      follow_redirect!
      assert_response :success
      assert_match "Travelling", "Travelling by car", response.body
  end

  test "Get New Todo Form and Reject the Todo Submission" do
    get "/todos/new"
    assert_response :success
    assert_no_difference 'Todo.count' do
    post todos_path, params: { todo: { name: " " , description: " "} }
    end
    assert_match "errors", response.body
    assert_select 'div,.panel'
    assert_select 'h2,.panel-title'
  end
end
