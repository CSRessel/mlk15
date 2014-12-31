class ArtsController < ApplicationController
  before_filter :require_admin, only:[:new, :create, :destroy]

  def new
    @art = Art.new
  end

  def create
    @art = Art.new(art_params)
    if @art.save
      flash[:notice] = 'new art listing created'
      redirect_to arts_path
    else
      render 'new'
    end
  end

  def index
    @arts = Art.all
  end

  def destroy
    @art = Art.find(params[:id])
    if @art.destroy
      flash[:notice] = 'art listing deleted'
      redirect_to arts_path
    else
      flash[:alert] = 'unable to delete art listing'
      redirect_to arts_path
    end
  end

  private

    def art_params
      params.require(:art).permit(:title, :artist, :blurb, :image, :remote_image_url)
    end

    def require_admin
      if !is_admin?
        flash[:alert] = 'access denied'
        redirect_to root_path
      end
    end
end
