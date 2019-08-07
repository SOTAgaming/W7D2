Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do 
    resources :notes, only: [:new, :create, :update, :destroy]
  end 
  resource :sessions, only: [:new, :create, :destroy]
  resources :bands do 
    resources :albums, only: [:new]
  end 
  resources :albums do 
    resources :tracks, only: [:new]
  end 

  resources :tracks

  resources :notes
end
