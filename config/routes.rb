Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :topics
    resources :puns
  end

end
