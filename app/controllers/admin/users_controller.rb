class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin
  layout "admin"

  def index
    @users = User.all_except(current_user)
  end

  def make_admin
    @user = User.find_by_token(params[:id])
    @user.make_admin!
    redirect_to :back
  end

  def make_user
    @user = User.find_by_token(params[:id])
    @user.make_user!
    redirect_to :back
  end

  private

  def user_params
    params.require(:user).permit(:token, :nickname)
  end

end
