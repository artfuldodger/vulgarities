Vulgarities::Application.routes.draw do
  root to: 'vulgarities#index'
  resources :vulgarities, only: [:index]
  resources :apis, only: [:index]
end
