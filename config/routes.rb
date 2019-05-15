Rails.application.routes.draw do
  resources :resources
  resources :languages
  resources :students

  resources :mentors do
    resources :resources
  end

  root to: 'application#index'

  get '/mentor_login', to: 'sessions#mentor_new'
  get '/student_login', to: 'sessions#student_new'

  get '/auth/github/callback' => 'sessions#mentor_gh_create'

  post '/mentor_login', to: 'sessions#mentor_create'
  post '/student_login', to: 'sessions#student_create'

  get '/logout', to: 'sessions#logout'

end
