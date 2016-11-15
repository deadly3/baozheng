class Admin::RequestsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin
  layout "admin"

  def index
    @requests = Request.all
  end

  def show
    @request = Request.find_by_token(params[:id])
  end

  def choose
    @request = Request.find_by_token(params[:id])
      if @request.selected?
        flash[:warning] = '已经抢过这个单了哟~'
      else
        @request.choose!
      end
    redirect_to :back
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id, :before_picture, :dream_picture, :token, :aasm_state)
  end

end
