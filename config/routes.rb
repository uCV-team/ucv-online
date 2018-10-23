Rails.application.routes.draw do
  root 'home#index'

  resource :cv
  resolve('Cv') { [:cv] }

  devise_for :users

  get 'home/check'
end
