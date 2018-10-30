Rails.application.routes.draw do
  resources :homeworks do
    collection do
      get 'simple'
    end
  end

  resources :drivings do
    collection do
      get 'simple'
      get 'schedule'
    end
  end

  resources :instructors
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :group_apps
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :users do
    collection do
      post 'create_manual'
    end
    member do
      get 'change_password'
    end
    member do
      patch 'update_password'
    end
  end

  root "group_apps#index"
end
