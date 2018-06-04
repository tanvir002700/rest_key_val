Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get '/values', to: 'stores#index'
  post '/values', to: 'stores#create'
  patch '/values', to: 'stores#update'
end
