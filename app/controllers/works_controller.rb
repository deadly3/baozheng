class WorksController < ApplicationController

  def index
    @works = Work.published.paginate(:page => params[:page], :per_page => 8)
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :price, :image, :user_id, :is_hidden)
  end

end
