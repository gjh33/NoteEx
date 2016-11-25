class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_user
    if User.exists?(id: session[:user_id])
      User.find(session[:user_id])
    else
      nil
    end
  end

  def require_user_presence!
    unless current_user
      redirect_to login_url
      false
    end
  end
end
