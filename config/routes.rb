Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  root 'tops#index'
  # resources :tops, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
