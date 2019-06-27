Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'teams#index'
  resources :teams do
    resources :comments
  end
  get 'my_page' => 'teams#my_page', as: 'my_page'
  get 'cancel' => 'teams#cancel', as: 'cancel'
  get 'accept/:id' => 'teams#accept', as: 'accept'
  post 'teams/apply/:id' => 'teams#apply', as: 'apply'
  post 'teams/recruit/:id' => 'teams#recruit', as: 'recruit'
  get 'teams/idea_status/:id' => 'teams#idea_destroy', as: 'idea_destroy'

  get 'vote/:team_id/:user_id' => 'votes#create', as: 'votes'
  delete 'vote/:team_id' => 'votes#destroy', as: 'vote'
  get 'csv_files/' => 'teams#csv_files'
  get 'notice' => 'teams#notice'
end
