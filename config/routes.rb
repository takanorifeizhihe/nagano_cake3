Rails.application.routes.draw do
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 顧客用
scope module: :public do
#homes
root to: "homes#top"
get '/about', to: 'homes#about'
#addresses
resources :addresses, :only => [:index, :edit, :create, :update, :destroy ]
#cart_items
resources :cart_items, :only => [:index, :create, :update ]
delete '/cart_items/:id', to: 'cart_items#destroy'
delete '/cart_items/destroy_items', to: 'cart_items#destroy_items'
#items
resources :items, :only => [:index, :show ]
#order_infos
resources :order_infos, :only => [:new, :index, :create, :show ]
post '/oder_infos/confirm', to: 'order_infos#confirm'
post '/oder_infos/complete', to: 'order_infos#complete'
#customers
resources :customers, :only => [:edit, :update ]
get '/customers/my_page', to: 'customers#show'
get '/customers/unsubscribe', to: 'customers#unsubscribe'
patch '/customers/withdraw', to: 'customers#withdraw'

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
resources :order_infos, :only => [:show, :update ]
#order_details
patch '/order_details/:id', to: 'order_details#update'  
  
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
