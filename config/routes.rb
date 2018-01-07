Rails.application.routes.draw do
  namespace :admin do
  end
  if Rails.env.development?
    get '/login_as/:user_id', to: 'development/sessions#login_as'
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  namespace :admin do
    namespace :login do
      resource :identifier, only: %i[show create]
      resource :password, only: %i[show create]
    end
    resource :logout, only: %i[destroy]
    resource :dashboard, only: %i[show]
    resources :users
    resources :invitations, param: :uuid, only: %i[index new create destroy] do
      resource :register, only: %i[show create]
    end
    resource :site, only: %i[edit update]
    resources :categories, only: %i[index create edit update destroy]
    resources :tags, only: %i[index create edit update destroy]
    resources :authors, only: %i[index create edit update destroy]
    resources :articles, param: :uuid, only: %i[index new create edit update destroy] do
      resource :preview, only: %i[show]
      resource :publish, only: %i[update]
      resources :article_blocks, controller: 'articles/article_blocks', only: %i[index show create edit update destroy] do
        patch :swap_level
      end
    end
  end

  get '/admin' => redirect('/admin/login/identifier')

  root 'home#index'
end
