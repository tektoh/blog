# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    get "/login_as/:user_id", to: "development/sessions#login_as"
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
    resource :site, only: %i[new create edit update]
    resources :categories, only: %i[index create edit update destroy]
    resources :tags, only: %i[index create edit update destroy]
    resources :authors, only: %i[index create edit update destroy]
    resources :articles, param: :uuid, only: %i[index new create edit update destroy] do
      resource :preview, controller: "articles/previews", only: %i[show]
      resource :publish, controller: "articles/publishes", only: %i[update]
      resources :article_blocks, controller: "articles/article_blocks", only: %i[index show create edit update destroy] do
        patch :swap_level
      end
    end

    root "root#index"
  end

  get "/tags/:tag_slug", as: :tag, to: "articles#index"
  get "/authors/:author_slug", as: :author, to: "articles#index"
  get "/archives/:year", to: "articles#index"
  get "/archives/:year/:month", as: :archive, to: "articles#index"
  get "/:category_slug", as: :category, to: "articles#index"
  get "/:category_slug/:article_slug", as: :article, to: "articles#show"

  root "articles#index"
end
