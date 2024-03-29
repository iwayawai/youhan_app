Rails.application.routes.draw do
  # 会員用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions',
  passwords: 'public/passwords'
  }

  devise_scope :user do
    post 'users/guest_sign_in' => 'public/sessions#guest_sign_in'
  end
  
  scope module: :public do
    root to:"homes#top"
    get "about"=>"homes#about", as:"about"
    
    
    resources :users, only:[:show] do
      member do
        get 'favorites'
        get 'comments'
      end
      
      collection do
        get 'information/edit' => "users#edit"
        patch 'information' => "users#update"
        get 'unsubscribe' => "users#unsubscribe"
        patch 'withdraw' => "users#withdraw"
      end 
    end 
    
    resources :recipes do
      resources :favorites, only:[:create, :destroy] 
      resources :comments, only:[:create, :destroy]
    end
    
  end
    
  #管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to:"users#index"
    
    resources :users, only: [:show,:destroy] do
      resources :comments, only: [:index,:destroy]
    end 
    
    resources :genres, only: [:index,:create,:edit,:update]

  end

 mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
