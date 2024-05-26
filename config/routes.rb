Rails.application.routes.draw do
  
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :cafes, only: [:index, :show, :edit, :update, :destroy]
    resources :reviews, only: [:destroy]
  end
  
  devise_for :users, controllers: {
      sessions: 'public/sessions',
      registrations: 'public/registrations'
    }
  
  devise_scope :user do
    post "public/guest_sign_in", to: "public/sessions#guest_sign_in"
  end
  
  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about', as: 'about'
    
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :cafes, only: [:new, :index, :show, :edit, :create, :update]
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
end