Rails.application.routes.draw do
  devise_for :admins

  get 'welcome/index'
  root 'welcome#index'

  resources :comentarios
  resources :calificaciones
  resources :calificacions
  resources :telefonos
  resources :usuarios
  resources :restaurantes

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
