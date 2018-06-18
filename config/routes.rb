Rails.application.routes.draw do
  namespace :api do
    get '/words' => 'words#index'
    get '/words/:id' => 'words#show'
    post '/words' => 'words#create'
    patch '/words/:id' => 'words#update'
    delete '/words/:id' => 'words#destroy' 

    get '/users' => 'users#index'
    get '/users/:id' => 'users#show'
    post '/users' => 'users#create'
    patch '/users/:id' => 'users#update'
    delete 'users/:id' => 'users#destroy'
    
    get '/game_plays' => 'game_plays#index'
    get '/game_plays/:id' => 'game_plays#show'
    post '/game_plays' => 'game_plays#create'
    
  end
end
