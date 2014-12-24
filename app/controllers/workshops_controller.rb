class WorkshopsController < ApplicationController
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
end
