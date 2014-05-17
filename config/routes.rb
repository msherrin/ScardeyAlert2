Bloccit::Application.routes.draw do

  devise_for :users

  resources :users, only: [:update]
  
  resources :topics do
		resources :posts, except: [:index]
	end

	resources :posts, only: [:index, :new, :create]
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end