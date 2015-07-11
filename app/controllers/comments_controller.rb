class CommentsController < ApplicationController
  before_action :set_message

  def create
    @comment = Comment.create! content: params[:comment][:content], message: @message, user: @current_user
  end

  private
    def set_message
      @message = Message.find(params[:message_id])
    end
end
