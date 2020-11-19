require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  def setup 
    @todo = Todo.new(name: "Shopping", description: "Make Shopping List") #description: "Prepare Shopping List") 
  end

  test "Todo should be valid" do
    assert @todo.valid?
  end
  
  test "name should be present" do
    @todo.name = " "
    assert_not @todo.valid?
  end

  test "description should be present" do
    @todo.description = " "
    assert_not @todo.valid?
  end

  test "Todo name should be unique" do
    @todo.save
    @todo2 = Todo.new(name: "Shopping")
    assert_not @todo2.valid?
  end
end
