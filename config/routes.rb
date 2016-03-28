Rails.application.routes.draw do
  devise_for :users
  get '/' => 'teas#index'
  get '/teas' => 'teas#index'
  get '/teas/new' => 'teas#new'
  post '/teas' => 'teas#create'
  # wildcard :id needs to go last otherwise it catches all words
  get '/teas/:id' => 'teas#show'
  get '/teas/:id/edit' => 'teas#edit'
  patch '/teas/:id' => 'teas#update'
  delete 'teas/:id' => 'teas#destroy'
  
  get '/suppliers' => 'suppliers#index'
  get '/suppliers/new' => 'suppliers#new'
  post '/suppliers' => 'suppliers#create'
  get '/suppliers/:id/edit' => 'suppliers#edit'
  patch '/suppliers/:id' => 'suppliers#update'
  delete '/suppliers/:id' => 'suppliers#destroy'

  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'

  get '/cart' => 'carted_teas#index'
  post '/cart' => 'carted_teas#create'
  patch '/cart' => 'carted_teas#update'
  get '/cart/:id' => 'carted_teas#index'
  patch '/cart/:id' => 'carted_teas#update'

end
