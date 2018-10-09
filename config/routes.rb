Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'home#show', as: :authenticated_root
  end

  root 'home#welcome'
  get 'home/check'
end
