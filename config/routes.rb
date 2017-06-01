Rails.application.routes.draw do
  root 'categories#index'

  resources :users, only: [:index, :new, :show, :create]

  resources :sessions, only: [:new, :create, :destroy]

  resources :categories, only: [:index, :show]

  resources :films, except: [:index, :edit, :update]  do
    resources :reviews, except: [:index, :show]
    resources :ratings, except: [:index, :show]
  end

  resources :comments, only: [:edit, :update, :destroy]
  resources :comments, only: [:new, :create], 
                       path: 'reviews/:review_id/comments',
                       as: :review_comments
end
