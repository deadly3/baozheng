class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin
  layout "admin"

  def index
    @users = User.all_except(current_user)
  end

  def make_designer
    @user = User.find_by_token(params[:id])
    @user.make_designer!
    redirect_to :back
  end

  def make_not_designer
    @user = User.find_by_token(params[:id])
    @user.make_not_designer!
    redirect_to :back
  end

  def accept
    @user = User.find_by_token(params[:id])
    @user.is_candidate = false
    @user.save

    @user.make_designer!
    redirect_to :back
  end

  def reject
    @user = User.find_by_token(params[:id])
    @user.is_candidate = false
    @user.save
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:token, :nickname)
  end

end
