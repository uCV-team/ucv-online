Rails.application.routes.draw do
  root 'home#coming_soon'
  match '*path' => 'home#coming_soon', via: :all

  get '/search', to: 'home#search'
  get '/coming_soon', to: 'home#coming_soon'
  
  #root 'cvs#show'
  get 'cv/edit/:section', to: 'cvs#edit', as: 'edit_cv_section'
  get 'search', to: 'searches#index'

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

  devise_for :users
  get 'home/check'
end
