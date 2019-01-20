Rails.application.routes.draw do
  devise_for :users

  namespace :v1 do
    resources :restaurants, :defaults => { :format => 'json' }
    get '/restaurant_categories/:restaurant_id', to: 'restaurants#categories'
  end
end
