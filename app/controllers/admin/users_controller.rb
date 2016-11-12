class Admin::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin
  layout "admin"

  def index
    @users = User.all_except(current_user)
  end

  def make_admin
    @user = User.find(params[:id])
    @user.make_admin!
    redirect_to :back
  end

  def make_user
    @user = User.find(params[:id])
    @user.make_user!
    redirect_to :back
  end

end
