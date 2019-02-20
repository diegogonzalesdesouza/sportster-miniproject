Rails.application.routes.draw do
  devise_for :users

  resources :brands, except: :index
  get 'all_brands', to: 'brands#index'

  resources :athletes, except: :index do
    resources :achievements, except: :show
  end

  get 'all_athletes', to: 'athletes#index'

  resources :interests, except: %i[index show new edit update]

  root 'pages#home'
end
