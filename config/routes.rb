Rails.application.routes.draw do
 devise_for :users, path_names: {
		sign_in: 'login', sign_out: 'logout', sign_up: 'signup'
	}
	
	resources :users, only: [:index, :show]
	resources :posts, only: [:index,  :create, :edit, :update, :destroy]
	
	root to: 'posts#index'
end
