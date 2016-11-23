class DesignersController < ApplicationController

  def index
    @designers = User.designer.recent
  end


  def show
    @designer = User.find_by_token(params[:id])
  end
end
