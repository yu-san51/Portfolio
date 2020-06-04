Rails.application.routes.draw do
  devise_for :users

  root "home#top"
  get "home/about" => "home#about"

  resources :items, shallow: true do
  	resources :favorites, only: [:create, :destroy]
      collection do
        get "favorites"
      end
    resources :contracts, except: [:index, :edit], shallow: true do
      collection do
        get "confirm"
        get "deal"
      end
    end
  end

  resources :messages, only: [:show, :create]

  resources :users, only: [:show, :edit, :update, :destroy], shallow: true do
    member do
      get "bye_confirm"
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
