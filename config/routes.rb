Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts, only: %i[new create destroy edit update]
  get 'posts/busca', to: 'posts#busca', as: :busca_post
end
