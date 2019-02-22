Rails.application.routes.draw do
  get 'achievements/new'
  get 'achievements/create'
  get 'achievements/show'
  get 'achievements/edit'
  get 'achievements/update'
  get 'achievements/destroy'
  devise_for :users

  resources :brands, except: :index
  get 'all_brands', to: 'brands#index'

  resources :athletes, except: :index do
    resources :achievements, except: :show
    get 'interests', to: 'interests#index'
  end

  get 'all_athletes', to: 'athletes#index'

  resources :interests, only: %i[create update destroy]

  root 'pages#home'
end

#
# Rails.application.routes.draw do
  get 'achievements/new'
  get 'achievements/create'
  get 'achievements/show'
  get 'achievements/edit'
  get 'achievements/update'
  get 'achievements/destroy'
#   devise_for :users, controllers: {
#     sessions: 'users/sessions'
#   }
# end
