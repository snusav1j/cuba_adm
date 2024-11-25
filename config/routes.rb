Rails.application.routes.draw do
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
  get "/profile", to: "user_profiles#index"
  get "/logout", to: "sessions#logout"
  
  root "home#index"

  resources :users do
		collection do
      get :edit_modal
		end
    member do
      
    end
	end

  resources :roles do
		collection do
      get :edit_modal
		end
    member do

    end
	end

  resources :profiles do
		collection do
      get :test
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
