Rails.application.routes.draw do
    # home page
    root to: 'pages#index'
    # third party authentication via facebook
    get 'auth/:provider/callback', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    # authenticated user can post thoughts and recommendations
    get '/post', to: 'pages#post'
    post '/post', to: 'pages#post'
    # persist these thoughts and recommendations
    patch '/thoughts', to: 'entry#thoughts'
    post '/book', to: 'entry#book'
    # browse all users and latest book recommendations
    get '/explore', to: 'pages#explore'
    # page for individual users
    get '/user/:id', to: 'pages#user', as: 'user'
    # pages for individual user's followers and following
    get '/users/:id/following', to: 'pages#following', as: 'following'
    get '/users/:id/followers', to: 'pages#followers', as: 'followers'
    # can follow/unfollow other users if logged in
    post '/relationships', to: 'entry#relationships'
    delete '/relationships', to: 'entry#relationships'
end
