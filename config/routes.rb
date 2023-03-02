Rails.application.routes.draw do
  # 会員用
  # URL /users/sign_in ...
  devise_for :user, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root to:"homes#top"
    get "about"=>"homes#about", as:"about"
    
    resources :users, only:[:show] do
      collection do
        get 'information/edit' => "users#edit"
        patch 'information' => "users#update"
        get 'unsubscribe' => "users#unsubscribe"
        patch 'withdraw' => "users#withdraw"
      end 
    end 
    
    resources :recipes do
      resources :favorites, only:[:index, :create, :destroy] 
      resources :comments, only:[:index, :create, :destroy]
    end
    
  end
    


  #管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to:"users#index"
    resources :users, only: [:show,:edit,:update]
    resources :comments, only: [:index,:destroy]
    resources :genres, only: [:index,:create,:edit,:update]

  end

end
