Rails.application.routes.draw do
  resources :links, only: [:new, :create]
end
