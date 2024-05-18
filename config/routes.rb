Rails.application.routes.draw do
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
    
    devise_for :users
    devise_scope :user do
        post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    end
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :posts
end