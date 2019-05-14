Rails.application.routes.draw do
  resources :resources
  resources :languages
  resources :students
  resources :mentors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'

  get '/mentor_login', to: 'sessions#mentor_new'
  get '/student_login', to: 'sessions#student_new'
  
  post '/mentor_login', to: 'sessions#mentor_create'
  post '/student_login', to: 'sessions#student_create'

  get '/logout', to: 'sessions#logout'

end
