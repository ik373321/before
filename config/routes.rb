Rails.application.routes.draw do
 devise_for :users
 root to:"tweets#index"
 resources :tweets do
  resources :comments, only: :create
  get :asia,:namerica,:samerica,:africa,:europe,:oceania,:search, on: :collection
 end 
 
end
