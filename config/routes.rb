Mmaa::Application.routes.draw do

  root :to => "static#index"
  match '/signin' => ' user_sessions#new', :as => :signin
  match '/signout' => 'user_sessions#destroy', :as => :signout
  match '/toggle_holiday' => 'holiday_dates#toggle_holiday', :as => :toggle_holiday
  
  resources :users
  resource :business do
    resources :bookables
    resources :appointment_types
    resource :calendar do
      resources :holiday_dates
    end
  end
  resources :user_sessions
  #match 'signin' => 'user_sessions#new', :as => :signin
  
end
