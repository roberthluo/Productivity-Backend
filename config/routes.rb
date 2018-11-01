Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get 'static_pages/contact'
	
	root 'static_pages#home'

	devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth' }

	get "/signin" => redirect("/users/sign_in")
end
