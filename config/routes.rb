Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'homes#top'

  get 'home/about' => 'homes#about'

  resources :books
end
