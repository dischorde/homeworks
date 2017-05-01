Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :subs, except: [:destroy]
  resources :comments, only: [:create, :show]
  resources :posts, except: [:destroy, :index] do
    resources :comments, only: [:new]
  end
end
