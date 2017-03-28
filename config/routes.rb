Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	root 'posts#index'

  	get '/signup' => 'users#new'
  	get '/login' => 'sessions#new'
  	post '/login' => 'sessions#create'
  	get '/logout' => 'sessions#destroy'

  	resources :users
  	resources :posts

    get 'search' => 'posts#search'
    

  	get '*unmatched_route', to: 'application#not_found'
end
