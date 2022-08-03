Rails.application.routes.draw do
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

# 顧客用
scope module: :public do
#homes
root to: "homes#top"
get '/about', to: 'homes#about'
#addresses
resources :addresses, :only => [:index, :edit, :create, :update, :destroy ]
#cart_items
get '/cart_items', to: 'cart_items#index'
delete '/cart_items', to: 'cart_items#destroy_items'
patch '/cart_items' , to: 'cart_items#update'
resources :cart_items, :only => [:create, :update ]
delete '/cart_items/:id', to: 'cart_items#destroy'
#items
resources :items, :only => [:index, :show ]
#order_infos
post '/order_infos/confirm', to: 'order_infos#confirm'
get '/order_infos/complete', to: 'order_infos#complete'
resources :order_infos, :only => [:new, :index, :create, :show ]

#customers
patch '/customers/withdraw', to: 'customers#withdraw'
resources :customers, :only => [:update]
get 'customers/info/edit', to: 'customers#edit'
#patch 'customers/info' , to: 'customers#update' 
get '/customers/my_page', to: 'customers#show'
get '/customers/unsubscribe', to: 'customers#unsubscribe'


end


# 管理者用
namespace :admin do
#homes
get '/', to: 'homes#top'
#items
resources :items, :only => [:new, :index, :create, :show, :update, :edit ]
#genres
resources :genres, :only => [:index, :create, :update, :edit ]
#customers
resources :customers, :only => [:index, :show, :update, :edit ]
#order_infos
resources :order_infos, :only => [:index, :show, :update ]
#order_details
patch '/order_details/:id', to: 'order_details#update'  
  
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
