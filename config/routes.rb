Rails.application.routes.draw do
  root "equipments#index"
  resources :equipments do
    member do
      post :toggle_favorite
    end

    collection do
      get :favorites
    end
  end
end

