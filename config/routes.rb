Rails.application.routes.draw do
  namespace :api do
    post 'notes/upload'
  end

  root to: 'basic#course_search'
  get 'login', to: 'basic#login'
  get 'sign_up', to: 'basic#sign_up'
  get 'course', to: 'basic#course_view'
  get 'profile', to: 'basic#user_profile'
  post 'authenticate', to: 'basic#authenticate_user'
  post 'register', to: 'basic#register_user'
end
