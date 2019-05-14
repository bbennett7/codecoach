Rails.application.routes.draw do
  resources :resources
  resources :languages
  resources :students
  resources :mentors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'

  get '/mentor_login', to: 'application#mentor_login'

  get '/student_login', to: 'application#student_login'

  get '/logout', to: 'application#logout'

end
