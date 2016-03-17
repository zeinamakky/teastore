Rails.application.routes.draw do
  get '/' => 'teas#index'
  get '/teas' => 'teas#index'
  get '/teas/new' => 'teas#new'
  post '/teas' => 'teas#create'
  # wildcard :id needs to go last otherwise it catches all words
  get '/teas/:id' => 'teas#show'
  get '/teas/:id/edit' => 'teas#edit'
  patch '/teas/:id' => 'teas#update'
  delete 'teas/:id' => 'teas#destroy'
  
end
