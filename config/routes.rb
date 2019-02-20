Rails.application.routes.draw do
  devise_for :users

  resources :brands, except: :index
  get 'brands', to: 'brands#index'

  resources :athletes, except: :index do
    resources :achievements, except: :show
    resources :interests, except: %i[show index]
  end
  get 'athletes', to: 'athletes#index'


  root 'pages#home'
end
