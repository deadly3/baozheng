class Admin::UsersController < ApplicationController
  before_filter :require_is_admin
  layout "admin"

  def make_admin
    @user = User.find(params[:id])
    @user.is_admin = true
    @user.save
    redirect_to :back
  end

  def make_user
    @user = User.find(params[:id])
    @user.is_admin = false
    @user.save
    redirect_to :back
  end

end
