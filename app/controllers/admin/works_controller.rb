class Admin::WorksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :require_is_admin
  layout "admin"

  def index
    @works = Work.paginate(:page => params[:page], :per_page => 8).recent
    # @works = Work.order("id DESC")
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

  def publish
    @work = Work.find(params[:id])
    @work.publish!
    redirect_to :back
  end

  def hide
    @work = Work.find(params[:id])
    @work.hide!
    redirect_to :back
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :price, :image, :user_id, :is_hidden)
  end

end
