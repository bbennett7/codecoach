Rails.application.routes.draw do
  root to: 'application#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  resources :users

  resources :languages, only: [:create]
  get '/languages/add_or_delete', to: 'languages#new_or_destroy', as: 'new_or_delete_language'
  post '/delete_language', to: 'languages#destroy'

  resources :users do
    resources :resources
  end

  get '/mentor/:id/student', to: 'mentors#show_student', as: 'mentor_student'


  get '/student/:id/mentor', to: 'students#show_mentor', as: 'student_mentor'
  post '/add_mentor', to: 'students#add_mentor'

  resources :resources, only: [:index, :create, :update]
  get 'resources/top_resources', to: 'resources#top_resources', as: 'top_resources'
  get 'resources/top_resources/:id', to: 'resources#top_resource', as: 'top_resource'

  get '/auth/github/callback' => 'sessions#mentor_gh_create'
end
