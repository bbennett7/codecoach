Rails.application.routes.draw do
  resources :resources
  resources :languages
  resources :students
  resources :mentors
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'application#index'

end
