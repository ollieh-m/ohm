Rails.application.routes.draw do
  root 'home#show'
  resource :nav, only: [:create]
  resource :about, only: [:show]
  resource :listen, only: [:show]
  resource :contact, only: [:show]
end
