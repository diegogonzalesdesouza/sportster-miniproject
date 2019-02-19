Rails.application.routes.draw do
  get 'athlete/index'
  get 'athlete/show'
  get 'athlete/new'
  get 'athlete/create'
  get 'athlete/edit'
  get 'athlete/update'
  get 'athlete/destroy'
  devise_for :users
  resources :athletes do
    resources :achievements, except: :show
    resources :interests, except: [:show, :index]
  end
  resources :brands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
end
