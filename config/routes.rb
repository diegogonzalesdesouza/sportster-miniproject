Rails.application.routes.draw do
  devise_for :users

  resources :brands, except: :index
  get 'all_brands', to: 'brands#index'

  resources :athletes, except: :index do
    resources :achievements, except: :show
    resources :interests, except: %i[show index]
  end
  get 'all_athletes', to: 'athletes#index'


  root 'pages#home'
end
