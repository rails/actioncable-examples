require "test_helper"

class CommentsChannelTest < ActionCable::Channel::TestCase
  def setup
    @message = messages(:tha_shiznit)
  end

  test "subscribed" do
    subscribe({ message_id: @message.id })

    assert_has_stream "messages:#{@message.id}:comments"
  end

  test "unsubscribed" do
    subscribe({ message_id: @message.id })

    stub_pubsub(subscription)

    unsubscribe

    assert_no_streams
  end

  private
    def stub_pubsub(subscription)
      subscription
        .connection
        .define_singleton_method(:pubsub) { ActionCable.server.pubsub }
    end
end
