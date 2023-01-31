Rails.application.routes.draw do
  devise_for :users, skip: :registrations
  devise_scope :user do
    get "/users/cancel" => "devise/registrations#cancel", as: :cancel_user_registration
    get "/users/sign_up" => "devise/registrations#new", as: :new_user_registration
    get "/users/edit" => "devise/registrations#edit", as: :edit_user_registration
    patch "/users" => "devise/registrations#update", as: :user_registration
    put "/users" => "devise/registrations#update", as: ''
    delete "/users" => "devise/registrations#destroy", as: ''
  end

  resources :seasons

  root 'home#index'
end
