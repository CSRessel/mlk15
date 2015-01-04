class StaticPagesController < ApplicationController
  def home
  end

  def video
  end

  def login
    if is_admin?
      flash[:notice] = 'you are logged in'
      redirect_to root_path
    end
  end
end
