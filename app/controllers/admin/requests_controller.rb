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

  def join_applicants
    #作为admin加入到  当前request的申请者 collection
    @request = Request.find_by_token(params[:id])
    if !@request.has_been_applied_by?(current_user)
       @request.applicants << current_user
      # join_applicants!(current_user)
      flash[:notice] = "已抢单！"
      redirect_to :back
    else
      flash[:alert] = "已经抢过这个单了哟~"
      redirect_to :back
    end
  end
  #
  # def join
  #   @request = Request.find_by_token(params[:id])
  #   @request.user = current_user
  #   current_user.join!(@request)
  #   flash[:notice] = "申请成功！"
  #   current_user.save
  #   @request.save
  #   redirect_to :back
  # end
  #
  # def apply
  #   @request = Request.find_by_token(params[:id])
  #     if @request.applied?
  #       flash[:warning] = '已经抢过这个单了哟~'
  #     else
  #       @request.apply!
  #       @request.user = current_user
  #       current_user.join!(@request)
  #       flash[:notice] = "已抢单！"
  #       @request.save
  #     end
  #   redirect_to :back
  # end

  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id, :before_picture, :dream_picture, :token, :aasm_state)
  end

end
