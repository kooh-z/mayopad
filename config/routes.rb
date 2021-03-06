Rails.application.routes.draw do
  resources :bookmarks do
    get 'bookmarks/index' => :index, as: 'bookmarks'
  end

  get 'searches/index'

  root             'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    get "bookmarks/toggle"
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :posts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
