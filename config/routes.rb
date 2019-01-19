Rails.application.routes.draw do
  root to: 'static_pages#index'

  get 'signup', to: 'users#new'
  resources :users
  resources :questions
end
