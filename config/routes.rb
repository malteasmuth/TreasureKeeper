Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  root to: "players#new"

  resources :pages, only: %i[index landing]

  resources :treasure_chests, only: %i[index show new create] do
    resources :challenges do
      get "revive", to: "players#revive_player"
      get "attack", to: "challenges#player_attack"
      resources :expenses, only: %i[show new create]
    end
  end

  resources :players, only: %i[index show new create edit update delete] do
    get "level-up", to: "players#level_up"
    get "buy_health", to: "players#buy_health"
  end

  get "home", to: "pages#home"
end
