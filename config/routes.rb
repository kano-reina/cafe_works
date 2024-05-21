Rails.application.routes.draw do
  get 'posts/new'
  get 'posts/edit'
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
    
    devise_for :users
    devise_scope :user do
        post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
    end
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :cafes, only: [:new, :index, :show, :create]
    resources :posts, only: [:new, :create, :edit, :update, :destroy]
end