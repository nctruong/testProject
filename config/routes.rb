Rails.application.routes.draw do
  resources :videos, only: :index do
    collection do
      post :import
      get :autocomplete
    end
  end

  root to: "videos#index"
end
