class CommentsController < ApplicationController
  before_action :set_message

  def create
    @comment = @message.comments.new(content: params[:content], user: @current_user)

    if @comment.save
      redirect_to message_path(@message)
    end
  end

  private
    def set_message
      @message = Message.find(params[:message_id])
    end
end
