require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "post stub" do
    post = posts(:one)

    assert_equal true, post.valid?
  end

  test "post uuid generation" do
    post = Post.create!

    assert_equal true, post.id.present?
    assert_equal true, post.valid?
  end
end
