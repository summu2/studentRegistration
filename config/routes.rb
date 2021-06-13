Rails.application.routes.draw do
  resources :atm_services do
    collection do
      get 'get_money_change'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
