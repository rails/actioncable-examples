class CommentsController < ApplicationController
  before_action :set_message

  def create
    @comment = @message.comments.new(content: params[:content], user: @current_user)

    if @comment.save
      respond_to do |format|
        format.turbo_stream { render partial: 'comments/comments', locals: { message: @message }, status: :created }
        format.html { redirect_to messages_path(@message) }
      end
    end
  end

  private
    def set_message
      @message = Message.find(params[:message_id])
    end
end
