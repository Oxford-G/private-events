Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources 'invitations'
  resources :users, except:[:destroy, :edit]
  resources :sessions, only:[:new, :create, :destroy]
  resources :events
  root 'events#index'
end
