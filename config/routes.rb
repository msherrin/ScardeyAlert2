Bloccit::Application.routes.draw do

  devise_for :users
  resources :posts
  get 'archives', to: 'archives#index'
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end