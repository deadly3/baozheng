class RequestsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]

  def index
    @requests = Request.where(:user_id => current_user.id)
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

  def edit
    @request = Request.find_by_token(params[:id])
  end

  def update
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to requests_path
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
    redirect_to requests_path
  end

  def choose
    @request = Request.find_by_token(params[:id])
    @request.choose!
    redirect_to :back
  end

  private

  def request_params
    params.require(:request).permit(:title, :description, :user_id, :before_picture, :dream_picture, :token)
  end

end