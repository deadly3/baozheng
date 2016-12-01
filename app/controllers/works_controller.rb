class WorksController < ApplicationController
  layout "with-designer-header", only:[:show]
   
  def index
    @works = Work.all.published.recent.paginate(page: params[:page], per_page: 6)
    # @works = Work.all.paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @work = Work.find(params[:id])
    @designer = @work.user
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.user = current_user
    if !current_user.is_candidate && @work.save
      current_user.is_candidate = true
      current_user.save
      redirect_to account_user_path(current_user.token)
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
