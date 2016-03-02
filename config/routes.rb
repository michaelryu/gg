Rails.application.routes.draw do
  
  root 'summoners#home'
  get 'summoners/show/:id', to: 'summoners#show'
  get 'summoners/home', to: 'summoners#home'

end
