class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def require_user_presence!
    unless User.exists?(id: session[:user_id])
      redirect_to login_url
    end
  end
end
