require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email:"user_test@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "valid user" do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = nil
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = nil
    assert_not @user.valid?
  end

  test "email should be valid" do
    invalid_emails = %w[hello@world th@is@is@wrong.com this@com testwrong.com]
    invalid_emails.each do |e|
      @user.email = e
      assert_not @user.valid?
    end
  end
  test "password should be at least 6 chars" do
    @user.password = @user.password_confirmation = "foo"
    assert_not @user.valid?
    @user.password = @user.password_confirmation = "foofoo"
    assert @user.valid?
  end
end
