class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages:#{params['message_id']}:comments"
  end

  def unsubscribed
    stop_stream_from "messages:#{params['message_id']}:comments"
  end
end
