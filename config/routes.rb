Rails.application.routes.draw do
  devise_for :users
  resources :athletes do
    resources :achievements, except: :show
    resources :interests, except: [:show, :index]
  end
  resources :brands
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
