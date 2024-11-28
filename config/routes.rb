Rails.application.routes.draw do
  resources :sell_products
  resources :market_places
  resources :super_logs
  resources :product_logs
  resources :product_photos

  resources :profile_photos
  resources :autorization_logs
  resources :roles
  resources :user_profiles

  resources :sessions, only: [:create] do
    collection do
      get :logout
    end
  end

  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  get "/user_profiles/", to: "user_profiles#index"
  get "/logout", to: "sessions#logout"
  
  root "home#index"

  resources :users do
		collection do
      get :edit_modal
		end
    member do
      get :delete_user
    end
	end

  resources :products do 
		collection do
      get :edit_modal
      get :sell_modal
      get :sell
		end
    member do

    end
	end

  resources :roles do
		collection do
      get :edit_modal
		end
    member do
      get :delete_role
    end
	end

  resources :user_profiles do
		collection do
      # get :test
      post :change_profile_photo
		end
    member do

    end
	end

  resources :tasks do
		collection do
      
		end
    member do

    end
	end

  get "up" => "rails/health#show", as: :rails_health_check
end
