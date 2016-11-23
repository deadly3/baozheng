class Account::ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox

  layout "account"

  def index
    @conversations = current_user.mailbox.conversations
  end

  def show
  end

  def reply
    @conversation ||= @mailbox.conversations.find(params[:id])
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = "Reply sent"
    redirect_to conversation_path(@conversation)
  end

  private

    def get_mailbox
      @mailbox ||= current_user.mailbox
    end



end
