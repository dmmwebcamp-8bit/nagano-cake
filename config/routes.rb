Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do

    root to: "homes#top"
    get "/about" => "homes#about"

    get 'items/search' => 'items#search'
    resources :items, only: [:index, :show]

    resource :customers, only: [:show, :update]
    get "/customers/information/edit" => "customers#edit"
    get "/customers/confirm" => "customers#confirm"
    patch "/customers/quit" => "customers#quit"

    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    resources :cart_items, only: [:index, :update, :destroy, :create]

    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    resources :orders, only: [:new, :create, :index, :show]

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  end

  namespace :admin do

    get "/" => "homes#top"

    resources :items, only: [:index, :new, :create, :show, :edit, :update]

    resources :genres, only: [:index, :create, :edit, :update]

    resources :customers, only: [:index, :show, :edit, :update] do
      get "/order_history" => "customers#order_history"
    end

    resources :orders, only: [:show, :update] do
      resources :order_details, only: [:update]
    end

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
