Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "/users/sign_in", :to => "users/sessions#new"
    get "/users/sign_out", :to => "users/sessions#destroy"
  end
  
  root 'tops#index'
  # resources :tops, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
