Rails.application.routes.draw do
  resources :profiles
  resources :proposals
  devise_for :users
  resources :proposals do
    member do
      post 'charge'
    end

  end


  root 'pages#home'

  get 'pages/contact'

  get 'pages/about'

  get '/all_proposals/:category', to: 'proposals#index', as: 'all_proposals_with_category'

  post '/all_proposals/', to: 'proposals#create_order', as: 'place_order'

  post 'pages/contact', to: 'pages#contact_email'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
