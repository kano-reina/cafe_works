Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :cafes, only: [:index, :show, :edit, :update, :destroy]
  end
  
  scope module: :public do
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
end