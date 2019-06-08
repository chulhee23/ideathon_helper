Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'teams#index'
  resources :teams do
    resources :comments
  end
  post 'teams/apply/:id' => 'teams#apply', as: 'apply'
end
