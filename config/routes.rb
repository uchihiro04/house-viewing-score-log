Rails.application.routes.draw do
  root to: "home#index"

  resources :house_viewings, only: [:create], param: :uuid do 
    resources :scores, only: [:index], module: :house_viewings
    resources :rooms, only: [:index], module: :house_viewings do
      resources :scores, only: [:index, :new, :create, :edit, :update], module: :rooms
    end
  end

  namespace :description do
    resources :house_viewings, only: [:show], param: :uuid 
  end

  namespace :dashboard do
    resources :rooms, only: [:index]
  end
end
