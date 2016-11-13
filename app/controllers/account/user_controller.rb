class Account::UserController < ApplicationController
  before_action :authenticate_user!
  layout 'account'
  def index
  end
  def show
  end
end
