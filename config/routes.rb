Rails.application.routes.draw do
  devise_for :users
  namespace :v1 do
    resources :restaurants, :defaults => { :format => 'json' }
    get '/restaurant_categories/:restaurant_id', to: 'restaurants#categories', :defaults => { :format => 'json' }

    post '/sessions/log_in', to: 'sessions#log_in', :defaults => { :format => 'json' }
    delete '/sessions/log_out', to: 'sessions#log_out'
    post '/sessions/sign_up', to: 'sessions#sign_up'

    post '/order_items', to: 'order_items#create', :defaults => { :format => 'json' }
    delete '/order_items', to: 'order_items#destroy', :defaults => { :format => 'json' }
    get '/current_order', to: 'orders#show', :defaults => { :format => 'json' }
    post '/pay', to: 'orders#complete', :defaults => { :format => 'json' }
    get '/user_orders/:user_id', to: "orders#user_orders"
  end
end
