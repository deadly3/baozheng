class Account::WorksController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @works = current_user.works
  end

  private

    def work_params
      params.require(:work).permit(:title, :description, :price, :image, :user_id, :is_hidden)
    end
end
