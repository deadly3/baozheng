class RequestsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @requests = Request.all.recent
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user

    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def show
    @request = Request.find_by_token(params[:id])
  end

  def apply
    @request = Request.find_by_token(params[:id])
      if @request.applied?
        flash[:warning] = '已经抢过这个单了哟~'
      else
        @request.apply!
        @request.user = current_user
        current_user.join!(@request)
        @request.save
      end
    redirect_to :back
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id, :before_picture, :dream_picture, :token, :aasm_state)
  end

end
