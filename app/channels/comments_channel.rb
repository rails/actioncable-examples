class CommentsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def follow(data)
    stop_all_streams
    stream_from "messages:#{data['message_id'].to_i}:comments"
  end

  def unfollow
    stop_all_streams
  end
end
