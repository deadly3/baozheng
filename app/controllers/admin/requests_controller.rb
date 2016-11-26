class Admin::RequestsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_designer
  layout "admin"

  def index
    @requests = Request.paginate(:page => params[:page], :per_page => 8).recent
  end

  def show
    @request = Request.find_by_token(params[:id])
  end

  def joined_requests
    @requests = current_user.applied_requests
  end

  def join_applicants
    #作为admin加入到  当前request的申请者 collection
    @request = Request.find_by_token(params[:id])
    if !@request.has_been_applied_by?(current_user)
       @request.applicants << current_user
      flash[:notice] = "已抢单！"
      redirect_to :back
    else
      flash[:alert] = "已经抢过这个单了哟~"
      redirect_to :back
    end
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id, :before_picture, :dream_picture, :token, :aasm_state)
  end

end
