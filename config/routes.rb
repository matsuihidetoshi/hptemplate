Rails.application.routes.draw do
  root to: 'static_pages#index'
  get 'company', to: 'static_pages#company'
  get 'service', to: 'static_pages#service'
  get 'access', to: 'static_pages#access'
  get 'careers', to: 'static_pages#careers'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users
  resources :questions
end
