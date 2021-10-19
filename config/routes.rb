Rails.application.routes.draw do
  root to: "posts#index"
  resources :posts, only: [:new, :create, :destroy]
  get "posts/busca", to: "posts#busca", as: :busca_post
end
