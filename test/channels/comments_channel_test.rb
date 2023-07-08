require "test_helper"

class CommentsChannelTest < ActionCable::Channel::TestCase
  def setup
    @message = messages(:tha_shiznit)
  end

  test "follow" do
    subscribe(@message)

    assert_has_stream "messages:#{@message.id}:comments"
  end

  test "unfollow" do
    subscribe(@message)
    unsubscribe(@message)

    assert_no_streams
  end

  test "subscribes and stream for current user" do
    user = users(:dogg)
    stub_connection current_user: user

    subscribe(@message)

    assert_has_stream_for user
  end
end
