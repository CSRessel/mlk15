class WorkshopsController < ApplicationController
  before_filter :require_admin, only:[:new, :create, :destroy]

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(workshop_params)
    if @workshop.save
      flash[:success] = 'new workshop listing created'
      redirect_to workshops_path
    else
      render 'new '
    end
  end

  def index
    @workshops = Workshop.all
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    if @workshop.destroy
      flash[:success] = 'workshop listing deleted'
      redirect_to workshops_path
    else
      flash[:error] = 'unable to delete workshop listing'
      redirect_to workshops_path
    end
  end

  private
    def workshop_params
      params.require(:workshop).permit(:title, :author, :blurb)
    end

    def require_admin
      if cookies[:AUTH] != ENV['admin_secret']
        flash[:error] = 'access denied'
        redirect_to root_path
      end
    end
end
