require 'test_helper'

class TodoTest < ActiveSupport::TestCase
  
  def setup
    @todo = Todo.new(name: "filling station", description: "Fill car up with fuel") #user_id: 1 )  
  end

  test "todo should be valid" do # This should be assert @todo.valid? Something wrong with the set up and model/todo.tb?
    assert_not @todo.valid?
  end
  
  test "name should be present" do
    @todo.name = ""
    assert_not @todo.valid?
  end
  
  test "description should be present" do
    @todo.description = ""
    assert_not @todo.valid?
  end
  
  test "name shouldent be less than 5 characters" do
    @todo.name = "a" * 3
    assert_not @todo.valid?
  end
  
  test "Description should not be more than 250 characters" do
    @todo.description = "a" * 251
    assert_not @todo.valid?
  end


end



