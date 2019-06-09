Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'teams#index'
  resources :teams do
    resources :comments
  end

  get 'cancel' => 'teams#cancel', as: 'cancel'
  get 'accept/:id' => 'teams#accept', as: 'accept'
  post 'teams/apply/:id' => 'teams#apply', as: 'apply'
  post 'teams/recruit/:id' => 'teams#recruit', as: 'recruit'
  
end
