class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  DEV_MODE = false

  protected

  def current_user
    return User.first if DEV_MODE
    if User.exists?(id: session[:user_id])
      User.find(session[:user_id])
    else
      nil
    end
  end

  def require_user_presence!
    return true if DEV_MODE
    unless current_user
      redirect_to login_url
      false
    end
  end
end
