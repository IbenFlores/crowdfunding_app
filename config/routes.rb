Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token

  namespace :api do
    namespace :v1 do
      post 'login', to: 'sessions#create'
      resources :projects, only: [:index, :show]
    end
  end

  scope "(:locale)", locale: /es|en/ do
    root "projects#index"
    resource :dashboard, only: [:show]
    resources :projects, only: [:index, :show] do
      resources :donations, only: [:new, :create]
    end
  end
end