Rails.application.routes.draw do
  devise_for :users

  root "home#top"
  get "home/about" => "home#about"

  resources :items, shallow: true do
  	resources :favorites, only: [:create, :destroy]
  end

  resources :rooms, only: [:create]
  
  resources :messages, only: [:show, :create]

  resources :contracts, except: [:destroy, :index], shallow: true do
  	collection do
  		get "confirm"
  		get "deal"
  	end
  end

  resources :teachers, only: [:show, :edit, :update], shallow: true do
  	member do
  		get "bye_confirm"
  		patch "bye_bye"
  	end
  end

  resources :students, only: [:show, :edit, :update], shallow: true do
  	member do
  		get "bye_confirm"
  		patch "bye_bye"
  	end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
