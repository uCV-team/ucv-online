Rails.application.routes.draw do
  root 'cvs#show'
  resource :cv, except: %i[create destroy new]
  resolve('Cv') { [:cv] }
  resources :educations

  devise_for :users
  get 'home/check'
end
