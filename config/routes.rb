Rails.application.routes.draw do
 devise_for :users, path_names: {
		sign_in: 'login', sign_out: 'logout', sign_up: 'signup'
	}
	
	resources :users, only: [:index, :show]
	resources :posts, only: [:index,  :create, :edit, :update, :destroy]
	resources :comments, only: [:create, :destroy]
	
	unauthenticated do
		as :user do
			root to: 'devise/registrations#new'
		end
	end
	
	root to: 'posts#index'
end
