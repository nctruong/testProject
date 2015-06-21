Rails.application.routes.draw do
  resources :videos do
    collection do
      post :import
      get :autocomplete
    end
  end

  resources :admin

  root to: "videos#index"
end
