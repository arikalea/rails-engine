Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchants/merchant_items#index'
      end
      resources :items do
        get '/merchant', to: 'items/item_merchants#show'
      end
      get '/revenue/merchants/:id', to: 'revenue/merchants#show'
    end
  end
end
