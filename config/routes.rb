Rails.application.routes.draw do

  namespace :api do # , defaults: { format: :json } 
    resources :topics
    resources :puns
  end

end
