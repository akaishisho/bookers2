Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }

  root "homes#top"

  get "/home/about" => "homes#about"
  get '/search', to: 'searchs#search'
  resources :users
  resources :books do
    resource :favorites,only:[:create,:destroy]
    resources :book_comments
  end

  resources :users do
    resource :relationships,only: [:create,:destroy]
    get 'followings' => 'relationships#followings',as: 'followings'
    get 'followers' => 'relationships#followers',as: 'followers'
  end
end
