class Designer::ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox
  layout "designer"

  def index
    #@mailbox = current_user.mailbox
    @conversations = @mailbox.conversations
  end

  def show
    #@mailbox = current_user.mailbox
    @conversation = @mailbox.conversations.find(params[:id])
    @receipts = @conversation.receipts.collect(&:receiver).uniq
  end

  def reply

    #@mailbox ||= current_user.mailbox
    @conversation = @mailbox.conversations.find(params[:id])
    current_user.reply_to_conversation(@conversation, params[:body])

    flash[:success] = "Reply sent"
    redirect_to account_conversation_path(@conversation)
  end
  private
    def check_red_point
      @mailbox = current_user.mailbox
      @conversations = @mailbox.conversations

      @conversations.each do |conversation|
        @receipts = conversation.receipts_for current_user

        conversation.need_red_point = @receipts.last.is_unread?
        conversation.save
      end

    end

    # def add_red_point
    #   @mailbox = current_user.mailbox
    #   @conversations = @mailbox.conversations
    #
    #   @conversations.each do |conversation|
    #     receipts = conversation.receipts_for current_user
    #     if receipts.last.is_unread?
    #       conversation.need_red_point = true
    #       conversation.save
    #     end
    #   end
    # end
end
