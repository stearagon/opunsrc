Rails.application.routes.draw do
  root 'root#root'

  namespace :api do # , defaults: { format: :json }
    resources :topics
    resources :puns
    get 'search', to: 'search#search'
  end

end
