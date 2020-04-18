Rails.application.routes.draw do
  root 'home#index'

  # Static pages
  get '/about', to: 'home#about'
  get '/privacy-policy', to: 'home#privacy'

  # root 'cvs#show'
  get 'cv/edit/:section', to: 'cvs#edit', as: 'edit_cv_section'
  get 'search', to: 'searches#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resource :cv, except: %i[new edit create destroy] do
    resources :educations, except: %i[index show]
    resources :experiences, except: %i[index show]
    resources :languages, except: %i[index show]
  end
  resources :cvs, only: [:show] do
    get '/print', to: 'cvs/printings#show', as: :print
  end
  resolve('Cv') { [:cv] }

  resources :locations, except: %i[index show]

  get 'home/check'
end
