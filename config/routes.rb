Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "/users/sign_in", :to => "users/sessions#new"
    get "/users/sign_out", :to => "users/sessions#destroy"
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  resources :groups, only: [:index, :new, :create, :show, :edit, :update] do
    resources :albums, only: [:new, :create, :show, :edit, :update, :destroy]
    member do
      get 'search'
    end
  end
  root 'tops#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
