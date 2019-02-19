Rails.application.routes.draw do
  devise_for :users
  resources :athletes do
    resources :achievements, except: :show
    resources :interests, except: [:show, :index]
  end
  resources :brands

  root 'pages#home'
end
