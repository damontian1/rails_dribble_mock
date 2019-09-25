Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  resources :posts do
  	member do
  		get "like", to: "posts#upvote"
  		get "dislike", to: "posts#downvote"
  	end
  	resources :comments
  end

  root "posts#index"
end
