Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :posts do
      get 'toggle-published' => 'posts#toggle_published', as: :toggle_published, on: :member
    end
    resources :comments, only: [:index, :destroy]
    get '/' => 'posts#index', as: :root
  end

  resources :posts, only: [:index, :show] do
    resources :comments
  end

  root to: 'posts#index'
end
