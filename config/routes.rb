Rails.application.routes.draw do
	root 'home#top'
	get 'home/about'
	devise_for :members,
	module: "members"

	devise_for :admins, controllers: {
		sessions: 'admins/sessions',
		registrations: 'admins/registrations'
	}
	# devise_for :admins, skip: :all
	# devise_scope :admin do
	# 	get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
	# 	post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
	# 	delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
	# end

	namespace :admins do
		resources :members
		resources :genres, only: [:index, :create, :edit, :update]
		resources :products, only: [:new, :index, :show, :edit, :update, :create]
		resources :orders, only: [:index, :show, :update]
		resources :oreder_products, only: [:update]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :members
  resources :products, only: [:index, :show]
  resources :shippings, only: [:index, :edit, :create, :update, :destroy]
    get 'orders/input' => 'orders#input'
    get 'orders/complete' => 'orders#complete'
    get 'orders/check' => 'orders#check'
  resources :orders, only: [:index, :show, :create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  resources :cart_items, only: [:index, :create, :update, :destroy]
end
