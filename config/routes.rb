Rails.application.routes.draw do
  get 'students/show'
  get 'students/edit'
  get 'students/update'
  get 'students/deleted_at'
  get 'teachers/show'
  get 'teachers/edit'
  get 'teachers/update'
  get 'teachers/deleted_at'
  get 'contracts/show'
  get 'contracts/edit'
  get 'contracts/update'
  get 'contracts/deleted_at'
  get 'contracts/edit'
  get 'contracts/deleted_at'
  get 'contracts/update'
  get 'contracts/show'
  get 'contracts/new'
  get 'contracts/confirm'
  get 'contracts/create'
  get 'contracts/update'
  get 'contracts/show'
  get 'rooms/create'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'chats/show'
  get 'chats/create'
  get 'items/new'
  get 'items/create'
  get 'items/index'
  get 'items/edit'
  get 'items/update'
  get 'items/delete'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
