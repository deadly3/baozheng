class WorksController < ApplicationController

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



  def search
      if @query_string.present?
        search_result = Work.ransack(@search_criteria).result(:distinct => true)
        @works = search_result.paginate(:page => params[:page], :per_page => 20 )
      end
    end


    protected

    def validate_search_key
      @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
      @search_criteria = search_criteria(@query_string)
    end


    def search_criteria(query_string)
      { :title_cont => query_string }
    end


  private

  def work_params
    params.require(:work).permit(:title, :description, :price, :image, :user_id, :is_hidden)
  end

end
