class Account::RequestsController < ApplicationController
  before_filter :authenticate_user!
  layout "account"

  def index
    @requests = Request.where(:user_id => current_user.id).recent
    @requests = Request.paginate(:page => params[:page], :per_page => 8).recent
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = current_user
    if @request.save
      redirect_to account_requests_path
    else
      render :new
    end
  end

  def edit
    @request = Request.find_by_token(params[:id])
    if @request.applicants.present?
      flash[:alert] = '已有人抢单的订单不可以进行修改💀'
      redirect_to :back
    else
    end
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to account_requests_path
    else
      render :edit
    end
  end

  def show
    @request = Request.find_by_token(params[:id])
  end

  def destroy
    @request = Request.find_by_token(params[:id])
    @request.destroy
    redirect_to account_requests_path
  end


  def display
    @request = Request.find_by_token(params[:id])
    @applicants = @request.applicants
  end

  def choose
    @request = Request.find_by_token(params[:id])
      if @request.selected?
        flash[:warning] = '已经选好合作达人喽~'
      else
        @user = params[:winner]
        @request.winner = @user
        @request.choose!
      end
    redirect_to :back
  end

  def make_payment
    @request = Request.find_by_token(params[:id])
      if @request.paid?
        flash[:warning] = '已经付过啦'
      else
        @request.make_payment!
      end
    redirect_to :back
  end


def rating
   @request = Request.find_by_token(params[:id])
  #  winner_id = @request.winner
  #  @winner = User.find(winner_id)
  @winner = User.find(@request.winner)
  @feedback = Feedback.new
end


def rating_submit
  rate = Feedback.create(rate_params)
  binding.pry
  redirect_to '/'

# 接受来自前一个页面的rating，然后生成一个新的rating数据
end



  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id, :before_picture, :dream_picture, :token, :aasm_state)
  end

  def rate_params
    params.require(:feedback).permit(:user_id, :rating, :commit)
  end
end
