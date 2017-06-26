Rails.application.routes.draw do
    root to: 'pages#index'
    get 'auth/:provider/callback', to: 'sessions#create'
    get '/post', to: 'pages#post'
    post '/post', to: 'pages#post'
    patch '/thoughts', to: 'entry#thoughts'
    post '/book', to: 'entry#book'
    delete '/logout', to: 'sessions#destroy'
end
