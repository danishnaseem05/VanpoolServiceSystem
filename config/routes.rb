Rails.application.routes.draw do
  #set the index page
  root to: 'welcome#show'
  
  # routes set for the following
  get 'pages/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
