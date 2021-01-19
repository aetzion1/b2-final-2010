Rails.application.routes.draw do  
  resources :competitions do
    resources :teams, only: [:new, :create]
  end
end