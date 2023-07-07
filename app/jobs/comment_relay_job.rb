class CommentRelayJob < ApplicationJob
  def perform(comment)
    ActionCable.server.broadcast "messages:#{comment.message_id}:comments",
      { comment: CommentsController.render(partial: 'comments/comment', locals: { comment: comment }), user_id: comment.user_id }
  end
end
