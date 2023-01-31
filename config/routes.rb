Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  devise_scope :user do
    get "/users/cancel" => "users/registrations#cancel", as: :cancel_user_registration
    get "/users/sign_up" => "users/registrations#new", as: :new_user_registration
    get "/users/edit" => "users/registrations#edit", as: :edit_user_registration
    patch "/users" => "users/registrations#update", as: :user_registration
    put "/users" => "users/registrations#update", as: ''
    delete "/users" => "users/registrations#destroy", as: ''
  end

  resources :seasons do
    resources :suggestions, only: [:new, :create, :destroy], controller: "seasons/suggestions" do
      post :pick, on: :collection, as: :pick_in
    end
  end
  resources :movies, only: [:index, :show] do
    get :search, on: :collection
  end

  root 'home#index'
end
