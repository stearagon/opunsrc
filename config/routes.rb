Rails.application.routes.draw do
  root 'api/topics#index'

  namespace :api do # , defaults: { format: :json }
    resources :topics
    resources :puns
  end

end
