Rails.application.routes.draw do
  namespace :api do
    get '/status', to: 'health#index'

    post '/sign_in', to: 'auth#create'
    post '/sign_up', to: 'registration#create'
  end
end
