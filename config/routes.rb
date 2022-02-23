Rails.application.routes.draw do
  resources :links, only: [:new, :create]
  get 'links/new/:slug', to: 'links#show', as: 'short_link'
end
