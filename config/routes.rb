Rails.application.routes.draw do
  resources :atm_services do
    collection do
      get 'get_money_change'
    end
  end
  resources :students do
    collection do
      get 'get_all_students'
      get 'get_student_by_id'
      post 'create_or_update_student'
      put 'delete_student'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
