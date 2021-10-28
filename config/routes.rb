Rails.application.routes.draw do
  resources :posts do
    get :busca, on: :collection
    resources :comments
  end

  root to: 'posts#index'
end
