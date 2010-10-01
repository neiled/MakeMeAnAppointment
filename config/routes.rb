Mmaa::Application.routes.draw do
  root :to => "static#index"
  resources :users
  resources :businesses
end
