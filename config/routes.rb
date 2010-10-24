Mmaa::Application.routes.draw do

  root :to => "static#index"
  match '/signin' => ' user_sessions#new', :as => :signin
  match '/signout' => 'user_sessions#destroy', :as => :signout
  
  resources :users
  resource :business do
    resources :bookables
    resources :appointment_types
  end
  resources :user_sessions
  #match 'signin' => 'user_sessions#new', :as => :signin
  
end
