require 'test_helper'

class MicropostTest < ActiveSupport::TestCase

    def setup
        @user = users(:russell)
        # Not idiomatic
        @micropost = @user.microposts.build(content: "Lorem ipsum")
    end

    test "should be valid" do
        assert @micropost.valid?
    end

    test "should be invalid" do
        @micropost.user_id = nil
        assert_not @micropost.valid?
    end

    test "content should be present" do
        @micropost.content = ""
        assert_not @micropost.valid?
    end

    test "content should be at most 140 characters" do
        @micropost.content = "a" * 141
        assert_not @micropost.valid?
    end

    test "order hould be most recent posts first" do
        assert_equal microposts(:most_recent), Micropost.first
    end

end
