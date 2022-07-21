Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:show, :edit, :index, :update]
  resources :users, only: [:show, :edit, :index, :update]
  get "/home/about" => "homes#about", as: "about"
  
  post 'books' => 'books#create'
  
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
