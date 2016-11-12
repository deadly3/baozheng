class Account::ProfileController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def show
  end



end
