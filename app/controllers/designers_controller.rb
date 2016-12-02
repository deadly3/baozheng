class DesignersController < ApplicationController
  layout "with-designer-header", only:[:show]

  def index
    @designers = User.designer.recent
  end


  def show
    @designer = User.find_by_token(params[:id])
    @works = @designer.works
    @feedbacks = @designer.feedbacks.paginate(:page => params[:page], :per_page => 8)

  end
end
