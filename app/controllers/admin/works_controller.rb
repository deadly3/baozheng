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
    @work = Work.create
    work.save
  end

  def show
    @work = Work.find(params[:id])
  end


end
