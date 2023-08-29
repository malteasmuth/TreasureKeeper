Rails.application.routes.draw do
  get 'players/index'
  get 'players/show'
  get 'players/new'
  get 'players/create'
  get 'players/edit'
  get 'players/update'
  get 'players/delete'
  get 'player/show'
  get 'player/edit'
  get 'player/update'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :players, only: %i[index show new create edit update delete]
  # Defines the root path route ("/")
  # root "articles#index"
end
