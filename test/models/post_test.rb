require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:test_user)
    @post = Post.new(title: "Example Post", body: "This is an example post body.", user: User.first)
  end

  test "title should be present" do
    @post.title = nil
    assert_not @post.valid?
  end

  test "title should be between 3-30 character" do
    @post.title = "te"
    assert_not @post.valid?
    @post.title = "x" * 31
    assert_not @post.valid?
    @post.title = "This is a valid title."
    assert @post.valid?
  end

  test "body should be present" do
    @post.body = nil
    assert_not @post.valid?
  end

  test "body should be between 5-150 characters" do
    @post.body = "x" * 4
    assert_not @post.valid?
    @post.body = "x" * 151
    assert_not @post.valid?
    @post.body = "This is a valid body."
    assert @post.valid?
  end

  test "post should belong to a user" do
    @post.user_id = nil
    assert_not @post.valid?
  end
end
