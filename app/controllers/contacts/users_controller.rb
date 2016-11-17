class Contacts::UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'account'

  def index
    @contacts = User.all
  end

  def create_conversation
    @recipient = User.find(params[:id])
    @conversation = current_user.send_message(@recipient, "✨", "开整！").conversation
    # @conversation.save
    flash[:success] = "会话开始"
    # redirect_to conversation_path(@conversation)
    redirect_to conversation_path(@conversation)
  end

  def reply

  end
end
