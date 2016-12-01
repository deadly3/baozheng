class Account::UserConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_mailbox


  def show
    #@mailbox ||= current_user.mailbox

    @designer = User.find_by_token(params[:id])
  end

  def update
    #@mailbox ||= current_user.mailbox

    @designer = User.find_by_token(params[:id])
# should find conversation_id
    conversation = current_user.send_message(@designer,  params[:body], @designer.id ).conversation
# redirect_to change render new
    redirect_to account_conversation_path(conversation)
  end


end
