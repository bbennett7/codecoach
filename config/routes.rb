Rails.application.routes.draw do
  resources :resources
  resources :languages

  resources :mentors do
    resources :resources
  end

  resources :students do
    resources :resources, only: [:index, :show, :update]
  end

  root to: 'application#index'

  get '/mentor_login', to: 'sessions#mentor_new'
  get '/student_login', to: 'sessions#student_new'

  get '/auth/github/callback' => 'sessions#mentor_gh_create'

  post '/mentor_login', to: 'sessions#mentor_create'
  post '/student_login', to: 'sessions#student_create'

  get '/logout', to: 'sessions#logout'

  get '/student/:id/mentor', to: 'students#show_mentor', as: 'student_mentor'

  get '/mentor/:id/student', to: 'mentors#show_student', as: 'mentor_student'

  post '/add_mentor', to: 'students#add_mentor'

end
