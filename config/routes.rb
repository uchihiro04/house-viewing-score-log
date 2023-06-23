Rails.application.routes.draw do
  resources :house_viewings, param: :uuid do 
    resources :rooms, only: [:index], module: :house_viewings
  end
end
