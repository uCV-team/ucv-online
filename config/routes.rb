class Subdomain
  def self.matches?(request)
    request.domain.split('.').size > 1 && request.subdomain != 'www'
  end
end

Rails.application.routes.draw do
  constraints(Subdomain) do
    get '/', to: 'cvs#show'
  end

  root 'home#index'

  # Static pages
  get '/about', to: 'home#about'
  get '/privacy-policy', to: 'home#privacy'

  get 'cv/:subdomain', to: 'cvs#show', as: 'cv_section'
  get 'cv/edit/:section', to: 'cvs#edit', as: 'edit_cv_section'
  get 'search', to: 'searches#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations'
  }

  resource :cv, except: %i[new edit create destroy show] do
    resources :educations, except: %i[index show]
    resources :experiences, except: %i[index show]
    resources :languages, except: %i[index show]
  end
  resources :cvs, only: [:show] do
    get '/print', to: 'cvs/printings#show', as: :print
  end
  resolve('Cv') { [:cv] }

  # resources :locations, except: %i[index show]
end
