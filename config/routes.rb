Rails.application.routes.draw do
  namespace :admin do
    resources :songs
    root to: "songs#index"
  end

  root 'home#show'
  resource :nav, only: [:create]
  resource :aside, only: [:show]
  resource :about, only: [:show]
  resource :listen, only: [:show]
  resource :contact, only: [:show, :create]
end
