class Account::WorksController < ApplicationController
  before_action :authenticate_user!
  layout "account"

  def index
    @works = current_user.works
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.user = current_user
    if @work.save
      current_user.is_candidate = true
      current_user.save
      redirect_to account_user_path
      flash[:notice] = "你已经申请成为达人了！"
    else
      render :new
    end
  end

  private

    def work_params
      params.require(:work).permit(:title, :description, :price, :image, :user_id, :is_hidden)
    end
end
