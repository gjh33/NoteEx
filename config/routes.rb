Rails.application.routes.draw do
  root to: 'basic#course_search'
  get 'login', to: 'basic#login'
  get 'sign_up', to: 'basic#sign_up'
  get 'course', to: 'basic#course_view'
  get 'profile', to: 'basic#user_profile'
end
