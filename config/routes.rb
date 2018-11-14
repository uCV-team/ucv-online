Rails.application.routes.draw do
  root 'cvs#show'
  get 'cv/edit/:section', to: 'cvs#edit', as: 'edit_cv_section'

  resource :cv, except: %i[new edit create destroy] do
    resources :educations, except: %i[index show]
    resources :experiences, except: %i[index show]
  end
  resolve('Cv') { [:cv] }

  devise_for :users
  get 'home/check'
end
