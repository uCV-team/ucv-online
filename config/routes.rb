Rails.application.routes.draw do
  resource :cv, except: %i[create destroy new]
  resolve('Cv') { [:cv] }

  root 'cvs#show'

  devise_for :users

  get 'home/check'
end
