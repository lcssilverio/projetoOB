Rails.application.routes.draw do
  get 'tags/index'
  get 'tags/new'
  resources :posts do
    get :busca, on: :collection
    resources :comments
  end

  root to: 'posts#index'
end
