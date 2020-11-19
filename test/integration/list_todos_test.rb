require 'test_helper'

class ListTodosTest < ActionDispatch::IntegrationTest
  def setup 
    @todo = Todo.create(name: "Shopping", description: "Create Shopping List")
    @todo2 = Todo.create(name: "Travelling", description: "Purchase train Tickets")
  end

  test "Should show Todos Index" do 
    get '/todos'
    assert_select "a[href=?]", todo_path(@todo), text: @todo.name 
    assert_select "a[href=?]", todo_path(@todo2), text: @todo2.name
  end
end
