Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmlB'
  get 'top' => 'homes#top'
  root to: 'homes#top'
  resources :books
  resources :books, only: [:show]
end

