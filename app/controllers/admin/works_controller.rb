class Admin::WorksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin
  layout "admin"

  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.user = current_user
    if @work.save
      redirect_to admin_works_path
    else
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to admin_works_path
    else
      render :edit
    end
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to admin_works_path
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :price, :image, :user_id)
  end

end
