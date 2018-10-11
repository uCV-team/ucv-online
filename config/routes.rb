Rails.application.routes.draw do
  root 'home#index'

  resource :personalcv
  resolve('Personalcv') { [:personalcv] }

  devise_for :users

  get 'home/check'
end
