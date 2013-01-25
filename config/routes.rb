Vulgarities::Application.routes.draw do
  root to: 'vulgarities#index'
  resources :vulgarities, only: [:index]
  resource :api, only: [:show]
end
