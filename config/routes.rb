Rails.application.routes.draw do
  namespace :v1 do
    resources :todos, only: [:index, :create, :update, :destroy]
    resources :users, only: [:index, :create]
  end
end
