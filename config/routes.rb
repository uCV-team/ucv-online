class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.domain.split('.').size > 1 && request.subdomain != 'publicv-staging'
  end
end

Rails.application.routes.draw do
  constraints(Subdomain) do
    get '/', to: 'cvs#show'
  end

  passwordless_for :users
  root 'home#index'
  # Static pages
  get 'legal/privacy-policy', to: 'legal#privacy'
  get 'legal/cookie-policy', to: 'legal#cookie'
  # TODO: get '/about', to: 'home#about'
  get 'legal/terms', to: 'legal#terms'

  get 'cv/:subdomain', to: 'cvs#show', as: 'cv_section'
  get 'cv/edit/:section', to: 'cvs#edit', as: 'edit_cv_section'
  put 'cv/download', to: 'cvs#download'

  namespace :users do
    resource :registrations, except: %i[show]
    resource :confirmation, only: %i[new show create update]
  end
  namespace :passwordless do
    resource :sessions, only: %i[new show create destroy]
  end

  namespace :admin do
    resource :dashboard, only: [:show]
    resources :users, only: %i[index]
    resources :flags, only: %i[index]
    resources :newsletters, except: %i[destroy] do
      get :preferences, on: :collection
      resources :submittal, only: [:create]
    end
  end
  resources :accounts, only: :destroy
  resource :cv, except: %i[new edit create destroy show] do
    resources :educations, except: %i[index show] do
      post :update_positions, on: :collection
    end
    resources :experiences, except: %i[index show] do
      post :update_positions, on: :collection
    end
    resources :languages, except: %i[index show]
  end
  resources :cvs, only: [:show] do
    get '/print', to: 'cvs/printings#show', as: :print
  end
  resources :messages, only: %i[new create index show update]
  resources :searches, only: %i[create show]
  resources :cv_markers, only: %i[index]
  resolve('Cv') { [:cv] }
  namespace :cvs do
    resources :flags, only: %i[new create]
  end
  get '/unauthorized_page', to: 'home#show', as: :unauthorized

  namespace :users do
    resources :preferences, only: [:index] do
      put :update, on: :collection
    end
  end
  resources :preferences, only: %i[show update] do
    get :unsubscribe, on: :member
  end
  resources :attachments, only: [:create]
  # resources :locations, except: %i[index show]
end
