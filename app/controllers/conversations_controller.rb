class ConversationsController < ApplicationController
  before_action :authenticate_user!


  def index
    @request = Request.find_by_token(params[:request_id])

    @conversation = @request.conversation
  end
end
