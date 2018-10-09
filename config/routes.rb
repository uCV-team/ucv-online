Rails.application.routes.draw do
  get 'home/check'
  root 'home#show'
end
