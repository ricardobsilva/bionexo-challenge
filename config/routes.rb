Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/find_ubs', to: 'basic_health_units#find_ubs'
    end
  end
end
