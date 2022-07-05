Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :index, :show, :edit, :destroy, :update]
  post 'books' =>'books#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "homes/about" =>"homes#about"
  resources :users, only: [:show, :edit, :index, :update]

end
