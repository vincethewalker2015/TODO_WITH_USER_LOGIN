require 'test_helper'

class UserTest < ActiveSupport::TestCase
 
  def setup
    @user = User.new(name: "vincent", email: "contact@vincethewalker.com", password_digest: "password")
  end
  
  test "User should be valid" do
    assert @user.valid?
  end
  
  test "User Name should be present" do
    @user.name = ""
    assert_not @user.valid?
  end
  
  test "User Name should not be more than 30 characters" do
    @user.name = "a" * 31
    assert_not @user.valid?
  end
  
  test "user email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  
  test "user email should not be more than 255 characters" do
    @user.email = "a" * 245 + "@example.com"
    assert_not @user.valid?
  end
  
  test "email should accept the correct format" do
    valid_emails = %w[user@example.com VINCE@gmail.com J.last@yahoo.ca john+smith@co.uk.org]
    valid_emails.each do |valids|
      @user.email = valids
      assert @user.valid?, "#{valids.inspect} should be valid"
    end
  end
  
   test "email should reject invalid addresses" do
    invalid_emails = %w[user@example vinnie@gmail,com last.name@yahoo john@smith@co+foo.org]
    invalid_emails.each do |invalids|
      @user.email = invalids
      assert_not @user.valid?, "#{invalids.inspect} should be valid"
    end
  end
  
  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
 
 
end
