Rails.application.routes.draw do
  devise_for :users

  resources :brands, except: :index
  get 'all_brands', to: 'brands#index'

  resources :athletes, except: :index do
    resources :achievements, except: :show
    get 'interests', to: 'interests#index'
  end

  get 'all_athletes', to: 'athletes#index'

  resources :interests, except: %i[index show new edit update]

  root 'pages#home'
end


#
# Rails.application.routes.draw do
#   devise_for :users, controllers: {
#     sessions: 'users/sessions'
#   }
# end
