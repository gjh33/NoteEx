class ApiController < ApplicationController
  before_filter :require_user_presence!

  protected

  def render_error(error, message, par={})
    par[:status] ||= 400
    render json: { error: error, msg: message, status: par[:status] }, status: par[:status]
  end

  def render_success(par={})
    par[:status] ||= 200
    data = par[:data] ? { data: par[:data] } : {}
    resp = { status: par[:status] }.merge(data)
    render json: resp, status: par[:status]
  end

  def require_user_presence!
    return true if DEV_MODE
    unless User.exists?(id: session[:user_id])
      render_error("Authentication Error", "User is not signed in")
      false
    end
  end
end
