Rails.application.routes.draw do
    # root page
    root to: 'pages#index'
    # third party authentication via facebook
    get 'auth/:provider/callback', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    # current user can access and post from their page
    get '/post', to: 'pages#post'
    post '/post', to: 'pages#post'
    # persist the submission of thoughts and book selections
    patch '/thoughts', to: 'entry#thoughts'
    post '/book', to: 'entry#book'
    # explore for users and book recommendations
    get '/explore', to: 'pages#explore'
    # page for individual users
    get '/user/:id', to: 'pages#user', as: 'user'
end
