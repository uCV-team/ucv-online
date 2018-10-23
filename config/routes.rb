Rails.application.routes.draw do
  resource :cv
  resolve('Cv') { [:cv] }

  root 'cvs#show'

  devise_for :users

  get 'home/check'
end
