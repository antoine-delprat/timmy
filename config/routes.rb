Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :children, only: [:new, :create, :index, :show]
  resources :games, only: [:index, :show]
end
