Rails.application.routes.draw do
  root 'home#index'
  resources :personalcvs
  devise_for :users
  get 'home/check'
end
