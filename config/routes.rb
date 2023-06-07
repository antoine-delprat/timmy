Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  authenticated :user do
    root 'children#index', as: :authenticated_root
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :children, only: %i[new create index show] do
    resources :games, only: %i[index] do
      resources :child_games, only: [:create]
    end
  end
  resources :child_games, only: [:show]
end
