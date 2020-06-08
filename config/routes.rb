Rails.application.routes.draw do
  devise_for :users

  root 'home#top'
  get 'home/about' => 'home#about'

  resources :items, shallow: true do
  	resources :favorites, only: [:create, :destroy]
      collection do
        get 'favorites'
      end
    resources :contracts, only: [:new, :create], shallow: true
  end

  resources :contracts, only: [:edit, :update, :show, :index] do
    member do
      get 'confirm'
      get 'deal'
      patch 'cancel'
    end
  end

  get 'message/:id' => 'messages#show', as: 'message'
  resources :messages, only: [:create]

  resources :users, only: [:show, :edit, :update, :destroy], shallow: true do
    member do
      get 'bye_confirm'
      get 'items'
      get 'notice'
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
