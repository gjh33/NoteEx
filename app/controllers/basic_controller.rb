class BasicController < ApplicationController
  before_filter :require_user_presence!, only: [:course_search, :course_view, :user_profile]

  def login
  end

  def sign_up
  end

  def course_search
  end

  def course_view
  end

  def user_profile
  end

  def authenticate_user
    user = User.where(username: params[:username])
    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to course_search_url
    else
      redirect_to login_url
    end
  end

  def register_user
    user = User.new(username: params[:username], password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect_to course_search_url
    else
      @user = user
      render :sign_up
    end
  end
end
