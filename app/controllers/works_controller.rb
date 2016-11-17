class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :price, :image, :user_id, :is_hidden)
  end

end
