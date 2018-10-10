Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  get 'home/check'
end
