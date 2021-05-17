Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'parties/new'
  post 'parties/create', to: 'parties#create', as: 'parties'
  post 'friendships/create'

  get 'welcome/index'
  root "welcome#index"

  resources :users do
    resources :dashboard, only: :index
  end

  resources :discover, only: :index
  resources :movies, only: [:index, :show]
  
  resources :sessions, only: [:new, :create, :destroy]

end
