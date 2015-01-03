class WorkshopsController < ApplicationController
  before_filter :require_admin, only:[:new, :create, :destroy]

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(workshop_params)
    if @workshop.save
      flash[:notice] = 'new workshop listing created'
      redirect_to workshops_path
    else
      render 'new '
    end
  end

  def index
    @workshops = Workshop.all
    @insert_scroll_body_tags = true;
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    if @workshop.destroy
      flash[:notice] = 'workshop listing deleted'
      redirect_to workshops_path
    else
      flash[:alert] = 'unable to delete workshop listing'
      redirect_to workshops_path
    end
  end

  private
    def workshop_params
      params.require(:workshop).permit(:title, :author, :blurb)
    end

    def require_admin
      if !is_admin?
        flash[:alert] = 'access denied'
        redirect_to root_path
      end
    end
end
