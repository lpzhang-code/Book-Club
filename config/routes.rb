Rails.application.routes.draw do
    root to: 'pages#index'
    get 'auth/:provider/callback', to: 'sessions#create'
    get '/post', to: 'pages#post'
    patch '/thoughts', to: 'entry#thoughts'
    delete '/logout', to: 'sessions#destroy'
end
