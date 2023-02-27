Rails.application.routes.draw do
  # 会員用
  # URL /users/sign_in ...
  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    root to:"homes#top"
    get "/about"=>"homes#about", as:"about"
    
  end
    


  #管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    root to:"users#index"
    resources :users, only: [:index,:show,:edit,:update]
    resources :comments, only: [:index,:destroy]
    resources :genres, only: [:index,:create,:edit,:update]

  end

end
