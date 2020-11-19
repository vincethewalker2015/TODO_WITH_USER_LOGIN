require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup 
    @user = User.new(name: "Luke", email: "luke@yahoo.ca", password_digest: "password")
  end

  test "User should be valid" do 
    assert @user.valid?
  end

  test "User Name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "User Name should not be more than 30 Characters" do
    @user.name = "a" * 31
    assert_not @user.valid?
  end

  test "User Email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "User Email should not be more than 2450 Characters" do
    @user.email = "a" * 245 + "@example.com"
    assert_not @user.valid?
  end
end
