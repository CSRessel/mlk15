module ApplicationHelper
  def is_admin?
    cookies[:AUTH] == ENV['AUTH_SECRET']
  end
end
