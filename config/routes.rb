Rails.application.routes.draw do
  root 'root#root'

  resources :users
  resource :session

  namespace :api do # , defaults: { format: :json }
    resources :topics
    resources :puns
    resources :likes
    get 'search', to: 'search#search'
  end

end
