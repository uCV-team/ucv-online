Rails.application.routes.draw do
  root 'cvs#show'
  resource :cv, except: %i[create destroy new] do
    resources :educations
  end
  resolve('Cv') { [:cv] }

  devise_for :users
  get 'home/check'
end
