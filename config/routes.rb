Rails.application.routes.draw do
  #set the index page
  resources :users
  root to: "pages#home"#:to => redirect('/welcome')
  # routes set for the following
  #get 'pages/home'
  #  match '/pages_home', to: "pages#home", via: get
  match '/login', to: 'sessions#new', via: :get
  match '/login_create', to: 'sessions#create', via: :post
  match '/logout', to: 'sessions#destroy', via: :delete



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
