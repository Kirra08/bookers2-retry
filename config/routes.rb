Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  get 'search' => 'searches#search'
  get "search_tag" => "searches#search_tag"
  get 'groups/create_event'
  get 'group_mails/user_mail'
  get 'books/new_index'
  get 'books/star_index'
  get 'books/serch_result'
  devise_for :users
  
  resources :users, only: [:index, :show, :edit, :update] do
     resource :relationships, only: [:create, :destroy]
     get 'followings' => 'relationships#followings', as: 'followings'
     get 'followers' => 'relationships#followers', as: 'followers'
     get "daily_posts" => "users#daily_posts"
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
  
  resources :chats, only: [:show, :create]
end
