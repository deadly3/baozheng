class ConversationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @request = Request.find_by_token(params[:request_id])

    @conversation = @request.conversation

    @messages = @conversation.messages if @conversation.present?

  end

  def create
    @request = Request.find_by_token(params[:request_id])
    @conversation = @request.conversation

    if @conversation.blank?
      current_user.send_message(@request.user , params[:body] , @request.title, @request )
    else
      current_user.reply_to_conversation(@conversation, params[:body])
    end

    redirect_to request_conversations_path(@request.token)

  end
end
