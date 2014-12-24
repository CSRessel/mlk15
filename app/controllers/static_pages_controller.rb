class StaticPagesController < ApplicationController
  def home
  end

  def video
  end

  def login
    if cookies[:AUTH] == ENV['auth_secret']
      flash[:notice] = 'you are logged in'
      redirect_to root_path
    end
  end
end
