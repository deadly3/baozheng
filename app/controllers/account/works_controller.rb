class Account::WorksController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @works = current_user.works
  end
end
