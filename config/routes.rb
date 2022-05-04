Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'searches#search'
  get 'groups/create_event'
  get 'group_mails/user_mail'
  devise_for :users
  
  resources :users, only: [:index, :show, :edit, :update] do
     resource :relationships, only: [:create, :destroy]
     get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end 
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end 
  
  resources :groups, only: [:new, :create, :index, :show, :edit, :update, :destroy] do
    resources :group_users, only: [:new, :create, :destroy]
    resources :group_mails, only: [:new, :create, :edit, :update, :destroy, :index]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
