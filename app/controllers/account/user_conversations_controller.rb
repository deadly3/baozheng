class Account::UserConversationsController < ApplicationController
  before_action :authenticate_user!


  def show
    @mailbox ||= current_user.mailbox

    @designer = User.find_by_token(params[:id])
  end
end
