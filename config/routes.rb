Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to:'users/registrations#create_profile'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  
  root 'items#index'

  resources :users
  resources :cards, only: [:new, :show]
  resources :items do
    collection do
      get 'purchase_comfirmation' #商品購入確認
      get  'get_category_children', defaults: { format: 'json' }
      get  'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :item_images, only: [:index, :new, :create, :destroy, :show, :update]
  end

end

