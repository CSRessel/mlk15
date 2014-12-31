module ApplicationHelper
  def is_admin?
    cookies[:AUTH] == ENV['auth_secret']
  end
end
