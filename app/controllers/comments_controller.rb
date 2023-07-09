class CommentsController < ApplicationController
  before_action :set_message

  def create
    @comment = @message.comments.new(content: params[:content], user: @current_user)

    if @comment.save
      respond_to do |format|
        format.turbo_stream
      end
    end
  end

  private
    def set_message
      @message = Message.find(params[:message_id])
    end
end
