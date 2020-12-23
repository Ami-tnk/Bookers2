Rails.application.routes.draw do
  get '/search' => 'searches#search'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }

  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end
