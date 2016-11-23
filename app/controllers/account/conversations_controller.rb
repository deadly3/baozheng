class Account::ConversationsController < ApplicationController
  before_action :authenticate_user!

  layout "account"

  def index
    @mailbox = current_user.mailbox
    @conversations = @mailbox.conversations
  end

  def show
    @mailbox = current_user.mailbox
    @conversation = @mailbox.conversations.find(params[:id])
    @receipts = @conversation.receipts.collect(&:receiver).uniq
  end

  def reply

    @mailbox ||= current_user.mailbox

    @mailbox = current_user.mailbox
    @conversation = @mailbox.conversations.find(params[:id])
    flash[:success] = "Reply sent"
    redirect_to account_conversation_path(@conversation)
  end




end
