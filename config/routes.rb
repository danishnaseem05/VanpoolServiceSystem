Rails.application.routes.draw do
  #set the index page
  resources :welcome
  root to: "welcome#show"#:to => redirect('/welcome')
  # routes set for the following
  get 'pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
