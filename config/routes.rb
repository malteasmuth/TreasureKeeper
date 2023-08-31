Rails.application.routes.draw do
  devise_for :users
  resources :challenges do
    get "attack", to: "challenges#player_attack"
    resources :expenses, only: %i[show new create]
  end

  root to: "pages#index"

  resources :treasure_chests, only: %i[index new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :players, only: %i[index show new create edit update delete]
  # Defines the root path route ("/")
  # root "articles#index"
end
