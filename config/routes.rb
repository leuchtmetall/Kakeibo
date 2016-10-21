Rails.application.routes.draw do
  resources :accounts do
    resources :categories
    resources :entries
  end
  devise_for :users

  get ':year/:month', to: 'pages#month', as: 'month'

  root to: 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
